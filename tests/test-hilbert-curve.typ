#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, hilbert-curve(1, step-size: 40))

#box(stroke: red+2pt, hilbert-curve(2, step-size: 40))

#box(stroke: red+2pt, hilbert-curve(3, step-size: 20))

#box(stroke: red+2pt, hilbert-curve(4, step-size: 20))

#pagebreak(weak: true)


#box(stroke: red+2pt, hilbert-curve(5, step-size: 10, stroke: blue+4pt))

#pagebreak(weak: true)


#box(stroke: red+2pt,
  hilbert-curve(6, step-size: 8, stroke: stroke(paint: gradient.linear(..color.map.crest, angle: 45deg), thickness: 4pt, cap: "square"))
)

#pagebreak(weak: true)
