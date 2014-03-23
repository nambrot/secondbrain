$ ->
  chrome.storage.sync.get {"domains": []}, (data) ->

    # only accept http (no https)
    return unless document.location.protocol.match(/http[^s]/)

    # check if blacklisted domain
    return if data.domains.some (domain) ->
      document.location.host.match domain

    # Extract text
    clone = $('body').clone()
    clone.find('script').remove()
    clone.find('style').remove()

    # Log result
    chrome.storage.sync.get {
      token: null
      email: null
      baseUrl: "http://memex2.herokuapp.com/"
    }, (data) ->
      if data.token
        $.post (data.baseUrl + "/api/log"), {url: document.location.href, html: clone.text().replace(/\s+/g, " "), user_token: data.token, user_email:data.email }, (evt) ->
        console.log("Memex Logged to #{data.baseUrl}")
