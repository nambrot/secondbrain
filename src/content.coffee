$ ->
  chrome.storage.sync.get {"domains": []}, (data) ->
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
        $.post (data.baseUrl + "/api/log"), {url: document.location.href, html: clone.text().replace(/\s+/g, " "), user_token: data.token, user_email:data.email }, (evt) ->
        console.log("Logged to #{data.baseUrl}")
