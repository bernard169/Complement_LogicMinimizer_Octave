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
G = dlmread ('function1.cubes');
Gsol = dlmread ('function1comp.cubes');
tic()
result7 = Complement (G, 6)
executionTimef1 = toc ()
Ok1 = IsSameFunction (result7, Gsol,6)

#test 7
H = dlmread ('function2.cubes');
Hsol = dlmread ('function2comp.cubes');
tic ()
result8 = Complement (H,5)
executionTimef2 = toc ()
Ok2 = IsSameFunction (result8, Hsol, 5)

#test 8 
I = dlmread ('function3.cubes');
Isol = dlmread ('function3comp.cubes');
tic ();
result9= Complement (I,6)
executionTimef3 = toc()
Ok3 = IsSameFunction (result9, Isol, 6)

#test 9 
J = dlmread ('function4.cubes');
Jsol = dlmread ('function4comp.cubes');
tic ();
result10 = Complement (J, 6)
executionTimef4 = toc()
Ok4 = IsSameFunction (result10, Jsol, 6)
