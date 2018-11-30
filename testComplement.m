#test 1
A = dlmread ('etape1OK.cubes')
result = Complement (A,5)

#test 2
B = dlmread ('etape2OK.cubes')
result2 = Complement (B, 4)

#test 3
C = dlmread ('etape3OK.cubes')
result3 = Complement (C,6)

#test 4 bif
D = dlmread ('etape4bif.cubes')
result4 = Complement (D,3)

#etape 4 mono
E = dlmread ('etape4mono.cubes')
result5 = Complement (E, 3)

#test 5
F = dlmread ('etape5.cubes')
result6= Complement (F, 3)

#test 6
G = dlmread ('function1.cubes')
Gsol = dlmread ('function1comp.cubes')
result7 = Complement (G, 6)
#result7 == Gsol