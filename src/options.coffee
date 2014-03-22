$('#submit').click ->
  chrome.storage.sync.set {
      baseUrl: $('#baseurl').val()
    }, ->
      alert('success')
  return false
$ ->
  chrome.storage.sync.get {
    baseUrl: "http://requestb.in/1jcz2m01"
  }, (items) ->
    $('#baseurl').val(items.baseUrl)