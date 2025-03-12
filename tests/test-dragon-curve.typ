#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, dragon-curve(0, step-size: 40))

#box(stroke: red+2pt, dragon-curve(1, step-size: 40))

#box(stroke: red+2pt, dragon-curve(2, step-size: 40))

#box(stroke: red+2pt, dragon-curve(3, step-size: 40))

#box(stroke: red+2pt, dragon-curve(4, step-size: 40))

#box(stroke: red+2pt, dragon-curve(5, step-size: 40))

#pagebreak(weak: true)


#box(stroke: red+2pt, dragon-curve(6, step-size: 16, stroke: blue+2pt))

#box(stroke: red+2pt, dragon-curve(7, step-size: 16, stroke: blue+2pt))

#box(stroke: red+2pt, dragon-curve(8, step-size: 16, stroke: blue+2pt))

#pagebreak(weak: true)


#box(stroke: red+2pt,
  dragon-curve(9, step-size: 16, stroke: stroke(paint: gradient.linear(..color.map.crest, angle: 45deg), thickness: 4pt, cap: "square"))
)

#pagebreak(weak: true)
