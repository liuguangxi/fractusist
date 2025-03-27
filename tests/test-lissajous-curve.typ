#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#grid(
  columns: 5,
  gutter: 5pt,
  ..range(5).map(k => box(stroke: red+2pt, lissajous-curve(1, 1, k/4, x-size: 100, y-size: 100))),
  ..range(5).map(k => box(stroke: red+2pt, lissajous-curve(1, 2, k/4, x-size: 100, y-size: 100))),
  ..range(5).map(k => box(stroke: red+2pt, lissajous-curve(2, 3, k/4, x-size: 100, y-size: 100))),
  ..range(5).map(k => box(stroke: red+2pt, lissajous-curve(3, 5, k/4, x-size: 100, y-size: 100))),
  ..range(5).map(k => box(stroke: red+2pt, lissajous-curve(5, 8, k/4, x-size: 100, y-size: 100))),
  ..range(5).map(k => box(stroke: red+2pt, lissajous-curve(8, 15, k/4, x-size: 100, y-size: 100))),
  ..range(5).map(k => box(stroke: red+2pt, lissajous-curve(20, 17, k/4, x-size: 100, y-size: 100))),
)
#pagebreak(weak: true)


#box(stroke: red+2pt,
  lissajous-curve(3, 4, 1/4, x-size: 200, y-size: 100, stroke: blue+2pt)
)

#box(stroke: red+2pt,
  lissajous-curve(4, 3, 1/4, x-size: 100, y-size: 200, stroke: blue+4pt)
)

#box(stroke: red+2pt,
  lissajous-curve(7, 10, 3/8, x-size: 300, y-size: 200, padding: 5, fill: blue.lighten(50%))
)

#box(stroke: red+2pt,
  lissajous-curve(5, 7, 1/2, x-size: 300, y-size: 200, padding: 10, fill: blue.lighten(50%), fill-rule: "even-odd", stroke: none)
)

#pagebreak(weak: true)
