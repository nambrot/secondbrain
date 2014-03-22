$('#submit').click ->
  chrome.storage.sync.set {
      baseUrl: $('#baseurl').val()
    }, ->
      alert('success')
  return false
$('#filters').click ->
  text = $('#filtertext').val()
  filters = $('#filtertext').val().split(/\s/)
  chrome.storage.sync.set {
    domains: filters
    raw: text
  }, ->
    alert 'updated filters correctly'
  return false
$ ->
  chrome.storage.sync.get ["baseUrl", "raw"], (items) ->
    $('#baseurl').val(items.baseUrl)
    $('#filtertext').val(items.raw)
