#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, sierpinski-arrowhead-curve(0, step-size: 40))

#box(stroke: red+2pt, sierpinski-arrowhead-curve(1, step-size: 40))

#box(stroke: red+2pt, sierpinski-arrowhead-curve(2, step-size: 40))

#box(stroke: red+2pt, sierpinski-arrowhead-curve(3, step-size: 40))

#box(stroke: red+2pt, sierpinski-arrowhead-curve(4, step-size: 20))

#pagebreak(weak: true)


#box(stroke: red+2pt, sierpinski-arrowhead-curve(5, step-size: 16, stroke: blue+2pt))

#pagebreak(weak: true)


#box(stroke: red+2pt,
  sierpinski-arrowhead-curve(6, step-size: 8, stroke: stroke(paint: blue, thickness: 4pt, cap: "round", join: "round"))
)

#pagebreak(weak: true)
