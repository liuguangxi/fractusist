#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#grid(
  columns: 4,
  gutter: 5pt,
  box(stroke: red+2pt, hypotrochoid(2, 1, 1, size: 120)),
  box(stroke: red+2pt, hypotrochoid(2, 1, 2, size: 120)),
  box(stroke: red+2pt, hypotrochoid(2, 1, 3, size: 120)),
  box(stroke: red+2pt, hypotrochoid(2, 1, 10, size: 120)),
  box(stroke: red+2pt, hypotrochoid(3, 1, 1, size: 120)),
  box(stroke: red+2pt, hypotrochoid(3, 1, 2, size: 120)),
  box(stroke: red+2pt, hypotrochoid(3, 1, 3, size: 120)),
  box(stroke: red+2pt, hypotrochoid(3, 1, 10, size: 120)),
  box(stroke: red+2pt, hypotrochoid(4, 1, 1, size: 120)),
  box(stroke: red+2pt, hypotrochoid(4, 1, 2, size: 120)),
  box(stroke: red+2pt, hypotrochoid(4, 1, 3, size: 120)),
  box(stroke: red+2pt, hypotrochoid(4, 1, 10, size: 120)),
  box(stroke: red+2pt, hypotrochoid(5, 1, 20, size: 120)),
  box(stroke: red+2pt, hypotrochoid(5, 2, 10, size: 120)),
  box(stroke: red+2pt, hypotrochoid(5, 3, 5, size: 120)),
  box(stroke: red+2pt, hypotrochoid(5, 4, 1, size: 120)),
  box(stroke: red+2pt, hypotrochoid(1, 2, 1, size: 120)),
  box(stroke: red+2pt, hypotrochoid(1, 3, 2, size: 120)),
  box(stroke: red+2pt, hypotrochoid(2, 3, 1, size: 120)),
  box(stroke: red+2pt, hypotrochoid(3, 5, 3, size: 120)),
  box(stroke: red+2pt, hypotrochoid(5, 8, 1, size: 120)),
  box(stroke: red+2pt, hypotrochoid(5, 8, 2, size: 120)),
  box(stroke: red+2pt, hypotrochoid(5, 8, 3, size: 120)),
  box(stroke: red+2pt, hypotrochoid(5, 8, 10, size: 120)),
)
#pagebreak(weak: true)


#box(stroke: red+2pt,
  hypotrochoid(13, 9, 20, size: 200, stroke: blue+2pt)
)

#box(stroke: red+2pt,
  hypotrochoid(9, 16, 5, size: 200, padding: 5, fill: blue.lighten(50%), fill-rule: "non-zero")
)

#box(stroke: red+2pt,
  hypotrochoid(9, 16, 5, size: 200, padding: 10, fill: blue.lighten(50%), fill-rule: "even-odd")
)

#pagebreak(weak: true)
