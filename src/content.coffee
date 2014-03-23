$ ->
  chrome.storage.sync.get "domains", (data) ->
    debugger;
    isMatch = data.domains.some (domain) ->
      document.location.host.match domain
    if (isMatch)
      return;
    clone = $('body').clone()
    clone.find('script').remove()
    clone.find('style').remove()
    chrome.storage.sync.get {
      token: null
      email: null
      baseUrl: "http://memex2.herokuapp.com/"
    }, (data) ->
      if data.token
        $.post data.baseUrl, {url: document.location.href + "/api/log", html: clone.text().replace(/\s+/g, " "), token: data.token, email:data.email }, (evt) ->
        console.log("Logged to #{document.location.href}")
