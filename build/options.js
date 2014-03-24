// Generated by CoffeeScript 1.7.1
(function() {
  $('#submit').click(function() {
    chrome.storage.sync.set({
      baseUrl: $('#baseurl').val(),
      token: null,
      email: null
    }, function() {
      return chrome.storage.sync.get({
        token: null,
        baseUrl: "http://memex2.herokuapp.com/"
      }, function(data) {
        if (data.token == null) {
          return chrome.tabs.create({
            url: "" + data.baseUrl + "/get_token"
          }, function(tab) {
            return chrome.tabs.executeScript(tab.id, {
              file: 'build/fetch_token.js'
            });
          });
        }
      });
    });
    return false;
  });

  $('#filters').click(function() {
    var filters, text;
    text = $('#filtertext').val();
    filters = $('#filtertext').val().split(/\s/);
    chrome.storage.sync.set({
      domains: filters,
      raw: text
    }, function() {
      return alert('updated filters correctly');
    });
    return false;
  });

  $(function() {
    chrome.storage.sync.get({
      baseUrl: "http://memex2.herokuapp.com"
    }, function(items) {
      return $('#baseurl').val(items.baseUrl);
    });
    return chrome.storage.sync.get(["baseUrl", "raw"], function(items) {
      $('#baseurl').val(items.baseUrl);
      return $('#filtertext').val(items.raw);
    });
  });

}).call(this);
