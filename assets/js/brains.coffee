#'use strict'
svg = d3.select('.brains')
n = 339
length = 22 # 22 for staggered
spacing = length * 1.55

#width  = $svg.width()
#height = $svg.height()

yi = 0
while n > 0
  yi += 1
  for xi in [1.5..21]
    x = spacing * xi
    y = spacing * yi - xi * 10
    if y > 580
      continue
    if y < 0 or n is 0
      break
    n--
    group = svg.append('image').attr('transform', (_, i) ->
      return "translate(#{[x,y]}) rotate(0) scale(-1,1)"
    ).attr('width':      length * 2 + 'px')
     .attr('height':     length * 2 + 'px')
     .attr('xlink:href': 'assets/images/Human_Brain_Symbol.svg')

#    group.append('text')
#    .text(n.toString() + '%')
#    .attr('text-anchor': 'middle')
#    .attr('alignment-baseline': 'middle')
#    .attr('dy', 0)
#    .attr('font-size', '50%')

defs = svg.append("defs")
filter = defs.append("filter").attr("id", "fade")
filter.append("feGaussianBlur")
  .attr("in", "SourceAlpha")
  .attr("stdDeviation", 4)
  .attr("result", "blur")
filter.append("feOffset")
  .attr("in", "blur")
  .attr("dx", 0)
  .attr("dy", 0)
  .attr("result", "offsetBlur")
filter.append("feFlood")
  .attr("in", "offsetBlur")
  .attr("flood-color", "#000")
  .attr("flood-opacity", "1.0")
  .attr("result", "offsetColor")
filter.append("feComposite")
        .attr("in", "offsetColor")
        .attr("in2", "offsetBlur")
        .attr("operator", "in")
        .attr("result", "offsetBlur")

feMerge = filter.append("feMerge")
feMerge.append("feMergeNode").attr("in", "offsetBlur")
feMerge.append("feMergeNode").attr("in", "SourceGraphic")

padding = 2
svg.append('rect')
  .attr("x", 220 - padding)
  .attr("y", 297 - padding)
  .attr("width", 280 + (padding*2))
  .attr("height", 40 + (padding*2))
  .style("fill", "white")
  .attr("filter", "url(#fade)")

svg.append('text')
  .text('Tiahne-2 brainpower')
  .attr('text-anchor': 'middle')
  .attr('alignment-baseline': 'middle')
  .attr('dx', 360)
  .attr('dy', 320)
  .attr('font-size', '175%')