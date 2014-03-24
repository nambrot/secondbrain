
# set base url on button click
$('#submit').click ->
  chrome.storage.sync.set {
      baseUrl: $('#baseurl').val()
      token: null
      email: null
    }, ->
      chrome.storage.sync.get {
          token: null
          baseUrl: "http://memex2.herokuapp.com/"
        }, (data) ->
          if !data.token?
            # we got no token, get it
            chrome.tabs.create url: "#{data.baseUrl}/get_token", (tab) ->
              chrome.tabs.executeScript(tab.id, {file: 'build/fetch_token.js'});
  return false

# set domain filters on button click
$('#filters').click ->
  text = $('#filtertext').val()
  filters = $('#filtertext').val().split(/\s/)
  chrome.storage.sync.set {
    domains: filters
    raw: text
  }, ->
    alert 'updated filters correctly'
  return false

# set 
$ ->
  chrome.storage.sync.get {
    baseUrl: "http://memex2.herokuapp.com"
  }, (items) ->
    $('#baseurl').val(items.baseUrl)
  chrome.storage.sync.get ["baseUrl", "raw"], (items) ->
    $('#baseurl').val(items.baseUrl)
    $('#filtertext').val(items.raw)

