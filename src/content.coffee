$ ->
  clone = $('body').clone()
  clone.find('script').remove()
  clone.find('style').remove()
  chrome.storage.sync.get {
    baseUrl: "http://requestb.in/1jcz2m01"
  }, (data) ->
    $.post data.baseUrl, {url: document.location.href, html: clone.text().replace(/\s+/g, " ") }, (evt) ->
      console.log('tst')
  