// Generated by CoffeeScript 1.7.1
(function() {
  chrome.storage.sync.set({
    token: document.getElementById('token').innerHTML,
    email: document.getElementById('email').innerHTML
  }, function() {
    return console.log('got it');
  });

}).call(this);
