#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, fibonacci-word-fractal(3, step-size: 40))

#box(stroke: red+2pt, fibonacci-word-fractal(6, step-size: 40))

#box(stroke: red+2pt, fibonacci-word-fractal(9, step-size: 20))

#box(stroke: red+2pt, fibonacci-word-fractal(12, step-size: 15))

#pagebreak(weak: true)


#box(stroke: red+2pt, fibonacci-word-fractal(13, step-size: 10))

#box(stroke: red+2pt, fibonacci-word-fractal(13, skip-last: false, step-size: 10))

#pagebreak(weak: true)


#box(stroke: red+2pt, fibonacci-word-fractal(14, step-size: 6, start-dir: 0, stroke: blue+2pt))
#h(10pt)
#box(stroke: red+2pt, fibonacci-word-fractal(14, step-size: 6, start-dir: 1, stroke: blue+2pt))

#box(stroke: red+2pt, fibonacci-word-fractal(14, step-size: 6, start-dir: 2, stroke: blue+2pt))
#h(10pt)
#box(stroke: red+2pt, fibonacci-word-fractal(14, step-size: 6, start-dir: 3, stroke: blue+2pt))

#pagebreak(weak: true)


#box(stroke: red+2pt,
  fibonacci-word-fractal(17, step-size: 6, stroke: stroke(paint: gradient.linear(..color.map.crest, angle: 45deg), thickness: 4pt, cap: "square"))
)

#pagebreak(weak: true)
