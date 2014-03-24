// Generated by CoffeeScript 1.7.1
(function() {
  $(function() {
    return window.setTimeout(function() {
      return chrome.storage.sync.get({
        domains: [],
        email: null,
        token: null,
        baseUrl: "http://memex2.herokuapp.com"
      }, function(data) {
        var domains, txt;
        if (!data.token) {
          return;
        }
        if (!data.email) {
          return;
        }
        if (document.location.href.match(data.baseUrl)) {
          return;
        }
        if (!document.location.host.match(".")) {
          return;
        }
        if (!document.location.protocol.match(/http[^s]/)) {
          return;
        }
        domains = data.domains.concat(["localhost"]);
        if (domains.some(function(domain) {
          return document.location.host.match(domain);
        })) {
          return;
        }
        txt = $('body').clone();
        txt.find('script').remove();
        txt.find('style').remove();
        txt = txt.text().replace(/\s+/g, " ");
        return $.post(data.baseUrl + "/api/log", {
          url: document.location.href,
          html: txt,
          user_token: data.token,
          user_email: data.email
        }, function(event) {
          return console.log("Page logged to memex " + data.baseUrl);
        });
      });
    }, 10000);
  });

}).call(this);
