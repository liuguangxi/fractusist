#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#box(stroke: red+2pt,
  z-order-curve(1, step-size: 40)
)

#box(stroke: red+2pt,
  z-order-curve(2, step-size: 40)
)

#box(stroke: red+2pt,
  z-order-curve(3, step-size: 20)
)

#box(stroke: red+2pt,
  z-order-curve(4, step-size: 20)
)

#pagebreak(weak: true)


#box(stroke: red+2pt,
  z-order-curve(5, step-size: 15, start-dir: 1, padding: 10)
)
#pagebreak(weak: true)


#box(stroke: red+2pt,
  z-order-curve(
    6, step-size: 8, padding: 10,
    stroke: stroke(paint: gradient.linear(..color.map.crest, angle: 45deg), thickness: 2pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)
