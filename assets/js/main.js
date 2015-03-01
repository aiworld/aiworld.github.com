// Generated by CoffeeScript 1.8.0
(function() {
  var context, el, footnote, footnotes, i, j, _i, _len, _ref;

  footnotes = $('.footnotes');

  _ref = $('.footnote');
  for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
    footnote = _ref[i];
    el = $(footnote);
    j = i + 1;
    context = $('.text.' + el.attr('class').replace('footnote', '').trim());
    context.attr('id', "fnref:" + j);
    el.before("<sup class='fn'><a href='#fn:" + j + "'>" + j + "</a></sup>");
    footnotes.append("<li id='fn:" + j + "'> " + (el.html()) + " <a class='back' href='#fnref:" + j + "'> context ↥</a> </li>");
  }

  $('.why-body').on('click', '.fn', function(event) {
    var id;
    $('.highlighted').removeClass('highlighted');
    id = $(this).find('a').attr('href').replace('#', '');
    return $(document.getElementById(id)).addClass('highlighted');
  });

  footnotes.on('click', '.back', function(event) {
    var id, klass;
    id = $(this).attr('href').replace('#', '');
    klass = $(document.getElementById(id)).attr('class');
    $('.highlighted').removeClass('highlighted');
    return $('.' + klass.split(' ').join('.')).addClass('highlighted');
  });

  $('.fn').each(function() {
    el = $(this);
    return el.qtip({
      content: {
        text: el.next('.footnote').clone()
      },
      hide: {
        delay: 200,
        fixed: true
      }
    });
  });

}).call(this);

//# sourceMappingURL=main.js.map