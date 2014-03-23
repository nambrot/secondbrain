// Generated by CoffeeScript 1.3.3
(function() {

  $('#submit').click(function() {
    chrome.storage.sync.set({
      baseUrl: $('#baseurl').val()
    }, function() {
      return alert('success');
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
    return chrome.storage.sync.get(["baseUrl", "raw"], function(items) {
      $('#baseurl').val(items.baseUrl);
      return $('#filtertext').val(items.raw);
    });
  });

}).call(this);
