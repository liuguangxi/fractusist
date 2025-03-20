#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, pythagorean-tree(1, trunk-len: 50))

#box(stroke: red+2pt, pythagorean-tree(2, trunk-len: 50))

#box(stroke: red+2pt, pythagorean-tree(3, trunk-len: 50))

#box(stroke: red+2pt, pythagorean-tree(4, trunk-len: 50, theta: 1/3))

#box(stroke: red+2pt, pythagorean-tree(5, trunk-len: 50, theta: 1/4))

#pagebreak(weak: true)


#box(stroke: red+2pt, pythagorean-tree(6, trunk-len: 80, filling: false))

#box(stroke: red+2pt, pythagorean-tree(7, trunk-len: 80, theta: 1/3, filling: false))

#pagebreak(weak: true)


#box(stroke: red+2pt, pythagorean-tree(8, root-color: black, leaf-color: green.transparentize(40%), trunk-len: 80))

#box(stroke: red+2pt, pythagorean-tree(9, root-color: black, leaf-color: green.transparentize(40%), trunk-len: 80, filling: false))

#pagebreak(weak: true)
