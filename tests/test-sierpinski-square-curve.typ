#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, sierpinski-square-curve(0, step-size: 40))

#box(stroke: red+2pt, sierpinski-square-curve(1, step-size: 40))

#box(stroke: red+2pt, sierpinski-square-curve(2, step-size: 10))

#box(stroke: red+2pt, sierpinski-square-curve(3, step-size: 10))

#pagebreak(weak: true)


#box(stroke: red+2pt, sierpinski-square-curve(4, step-size: 8, stroke: blue+2pt))

#pagebreak(weak: true)


#box(stroke: red+2pt, sierpinski-square-curve(5, step-size: 4, fill: blue.lighten(50%), stroke: blue))

#pagebreak(weak: true)
