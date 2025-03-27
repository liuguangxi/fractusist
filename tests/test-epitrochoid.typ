#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#grid(
  columns: 4,
  gutter: 5pt,
  box(stroke: red+2pt, epitrochoid(2, 1, 1, size: 120)),
  box(stroke: red+2pt, epitrochoid(2, 1, 2, size: 120)),
  box(stroke: red+2pt, epitrochoid(2, 1, 3, size: 120)),
  box(stroke: red+2pt, epitrochoid(2, 1, 10, size: 120)),
  box(stroke: red+2pt, epitrochoid(3, 1, 1, size: 120)),
  box(stroke: red+2pt, epitrochoid(3, 1, 2, size: 120)),
  box(stroke: red+2pt, epitrochoid(3, 1, 3, size: 120)),
  box(stroke: red+2pt, epitrochoid(3, 1, 10, size: 120)),
  box(stroke: red+2pt, epitrochoid(4, 1, 1, size: 120)),
  box(stroke: red+2pt, epitrochoid(4, 1, 2, size: 120)),
  box(stroke: red+2pt, epitrochoid(4, 1, 3, size: 120)),
  box(stroke: red+2pt, epitrochoid(4, 1, 10, size: 120)),
  box(stroke: red+2pt, epitrochoid(5, 1, 20, size: 120)),
  box(stroke: red+2pt, epitrochoid(5, 2, 10, size: 120)),
  box(stroke: red+2pt, epitrochoid(5, 3, 5, size: 120)),
  box(stroke: red+2pt, epitrochoid(5, 4, 1, size: 120)),
  box(stroke: red+2pt, epitrochoid(1, 2, 1, size: 120)),
  box(stroke: red+2pt, epitrochoid(1, 3, 2, size: 120)),
  box(stroke: red+2pt, epitrochoid(2, 3, 1, size: 120)),
  box(stroke: red+2pt, epitrochoid(3, 5, 3, size: 120)),
  box(stroke: red+2pt, epitrochoid(5, 8, 1, size: 120)),
  box(stroke: red+2pt, epitrochoid(5, 8, 3, size: 120)),
  box(stroke: red+2pt, epitrochoid(5, 8, 7, size: 120)),
  box(stroke: red+2pt, epitrochoid(5, 8, 13, size: 120)),
)
#pagebreak(weak: true)


#box(stroke: red+2pt,
  epitrochoid(13, 9, 6, size: 200, stroke: blue+2pt)
)

#box(stroke: red+2pt,
  epitrochoid(9, 10, 15, size: 200, padding: 5, fill: blue.lighten(50%), fill-rule: "non-zero")
)

#box(stroke: red+2pt,
  epitrochoid(9, 10, 15, size: 200, padding: 10, fill: blue.lighten(50%), fill-rule: "even-odd")
)

#pagebreak(weak: true)
