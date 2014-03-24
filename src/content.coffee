$ ->
  window.setTimeout ->
    chrome.storage.sync.get {
      domains: [],
      email: null,
      token: null,
      baseUrl: "http://memex2.herokuapp.com"
      }, (data) ->

        # abort if we don't have a data token
        return unless data.token

        # abort if we don't have an email
        return unless data.email

        # ignore pages on the app site itself
        return if document.location.href.match data.baseUrl

        # ignore if intranet (no TLD )
        return unless document.location.host.match "."

        # only accept http (no https)
        return unless document.location.protocol.match /http[^s]/

        # check if blacklisted domain
        return if data.domains.some (domain) ->
          document.location.host.match domain

        # Extract text
        txt = $('body').clone
        txt.find('script').remove
        txt.find('style').remove
        txt = txt.text().replace(/\s+/g, " ")

        # Log result
        $.post (data.baseUrl + "/api/log"), {
          url: document.location.href,
          html: txt,
          user_token: data.token,
          user_email:data.email
        }, (event) -> console.log("Memex Logged to #{data.baseUrl}")
  , 10000
