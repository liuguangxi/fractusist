#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, fractal-tree(1, trunk-len: 50))

#box(stroke: red+2pt, fractal-tree(2, trunk-len: 50))

#box(stroke: red+2pt, fractal-tree(3, trunk-len: 50))

#box(stroke: red+2pt, fractal-tree(4, trunk-len: 50, theta: 1, angle: 1/2))

#box(stroke: red+2pt, fractal-tree(5, trunk-len: 50, theta: 1/4, angle: 1/3))

#pagebreak(weak: true)


#box(stroke: red+2pt, fractal-tree(6, trunk-len: 80, trunk-rad: 6.0, angle: 1/6))

#box(stroke: red+2pt, fractal-tree(7, trunk-len: 80, angle: 1/5, ratio: 0.7))

#box(stroke: red+2pt, fractal-tree(8, trunk-len: 120, angle: 1/3, ratio: 0.6))

#pagebreak(weak: true)


#box(stroke: red+2pt, fractal-tree(9, root-color: black, leaf-color: blue.transparentize(50%), trunk-len: 150, trunk-rad: 5.0, angle: 1/4, ratio: 0.65))

#pagebreak(weak: true)
