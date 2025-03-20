#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, random-fractal-tree(1, trunk-len: 50))

#box(stroke: red+2pt, random-fractal-tree(2, trunk-len: 50))

#box(stroke: red+2pt, random-fractal-tree(3, trunk-len: 50))

#box(stroke: red+2pt, random-fractal-tree(4, trunk-len: 50, theta: 1, angle: 1/2))

#box(stroke: red+2pt, random-fractal-tree(5, trunk-len: 50, theta: 1/4, angle: 1/3))

#pagebreak(weak: true)


#box(stroke: red+2pt, random-fractal-tree(6, trunk-len: 70, trunk-rad: 6.0, angle: 1/6))

#box(stroke: red+2pt, random-fractal-tree(7, trunk-len: 70, angle: 1/5, ratio: 0.7))

#box(stroke: red+2pt, random-fractal-tree(8, trunk-len: 70, angle: 1/3, ratio: 0.6))

#pagebreak(weak: true)


#box(stroke: red+2pt, random-fractal-tree(9, seed: 123, root-color: black, leaf-color: yellow, trunk-len: 100, trunk-rad: 5.0, angle: 1/4, ratio: 0.7))

#box(stroke: red+2pt, random-fractal-tree(10, seed: 321, root-color: black, leaf-color: orange, trunk-len: 100, trunk-rad: 5.0, angle: 0.4, ratio: 0.75))

#pagebreak(weak: true)


#box(stroke: red+2pt, random-fractal-tree(11, seed: 3, root-color: black, leaf-color: fuchsia.transparentize(40%), trunk-len: 120, trunk-rad: 8.0, angle: 0.25, ratio: 0.78))

#pagebreak(weak: true)
