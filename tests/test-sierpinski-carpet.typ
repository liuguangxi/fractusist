#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#box(stroke: red+2pt,
  sierpinski-carpet(0, size: 150)
)

#box(stroke: red+2pt,
  sierpinski-carpet(1, size: 150)
)

#box(stroke: red+2pt,
  sierpinski-carpet(2, size: 150, padding: 10, fill: blue.lighten(50%), stroke: blue+4pt)
)

#box(stroke: red+2pt,
  sierpinski-carpet(3, size: 150, padding: 10, fill: blue.lighten(50%), stroke: none)
)

#pagebreak(weak: true)


#box(fill: black,
  sierpinski-carpet(4, size: 324, fill: orange, stroke: none)
)
#pagebreak(weak: true)
