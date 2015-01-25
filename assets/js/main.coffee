# check in all browsers / phones
footnotes = $('.footnotes')
for footnote, i in $('.footnote')
  el = $(footnote)
  j = i + 1
  context = $('.text.' + el.attr('class').replace('footnote', '').trim())
  context.attr('id', "fnref:#{j}")
  el.before("<sup class='fn'><a href='#fn:#{j}'>#{j}</a></sup>")
  footnotes.append(
    "<li id='fn:#{j}'>
      #{el.html()}
      <a class='back' href='#fnref:#{j}'> context ↥</a>
    </li>")

$('.why-body').on 'click', '.fn', (event) ->
  $('.highlighted').removeClass('highlighted')
  id = $(this).find('a').attr('href').replace('#', '')
  $(document.getElementById(id)).addClass('highlighted')

footnotes.on 'click', '.back', (event) ->
  id = $(this).attr('href').replace('#', '')
  klass = $(document.getElementById(id)).attr('class')
  $('.highlighted').removeClass('highlighted')
  $('.' + klass.split(' ').join('.')).addClass('highlighted')

$('.fn').each ->
  el = $(this)
  el.qtip
    content:
      text: el.next('.footnote').clone()
    hide:
      delay: 200
      fixed: true