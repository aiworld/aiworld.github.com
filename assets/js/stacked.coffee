#'use strict'
svg = d3.select('.stacked')

data = [{pct: 10,  year: 2022},
        {pct: 40,  year: 2040},
        {pct: 90,  year: 2075}]

x = 10
prev_radius = 0
for d, i in data
  radius = Math.sqrt(d.pct / Math.PI) * 14
  x += prev_radius + radius + 32
  group = svg.append('g').attr('transform', (d, i) ->
    y = 100
    "translate(#{[x,y]})"
  )

  group.append('circle')
     .attr( 'cx'    , 0      )
     .attr( 'cy'    , 0      )
     .attr( 'stroke', '#555' )
     .attr( 'fill'  , '#dde' )
     .attr( 'r'     , radius )

  group.append('text')
    .text(d.year)
    .attr('text-anchor': 'middle')
    .attr('alignment-baseline': 'hanging')
    .attr('dy', radius + 5)

  group.append('text')
    .text(d.pct + '%')
    .attr('text-anchor': 'middle')
    .attr('alignment-baseline': 'middle')
    .attr('dy', 0)
    .attr('font-size', (120.0 - (100.0 / parseFloat(d.pct)) * 3.5) + '%')


  prev_radius = radius