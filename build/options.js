// Generated by CoffeeScript 1.3.3
(function() {

  $('#submit').click(function() {
    return chrome.storage.sync.set({
      baseUrl: $('#baseurl').val()
    }, function() {
      return alert('success');
    });
  });

  $(function() {
    return chrome.storage.sync.get({
      baseUrl: "http://requestb.in/1jcz2m01"
    }, function(items) {
      return $('#baseurl').val(items.baseUrl);
    });
  });

}).call(this);
