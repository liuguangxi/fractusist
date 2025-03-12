#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, sierpinski-triangle(0, step-size: 40))

#box(stroke: red+2pt, sierpinski-triangle(1, step-size: 40))

#box(stroke: red+2pt, sierpinski-triangle(2, step-size: 40))

#box(stroke: red+2pt, sierpinski-triangle(3, step-size: 40))

#pagebreak(weak: true)


#box(stroke: red+2pt, sierpinski-triangle(4, step-size: 30, stroke: stroke(paint: blue, thickness: 2pt, join: "bevel")))

#pagebreak(weak: true)



#box(stroke: red+2pt, sierpinski-triangle(5, step-size: 16, fill: blue.lighten(50%), stroke: stroke(paint: blue, thickness: 2pt, join: "bevel")))

#pagebreak(weak: true)


#box(stroke: red+2pt,
  sierpinski-triangle(6, step-size: 8, fill: blue, stroke: none)
)

#pagebreak(weak: true)
