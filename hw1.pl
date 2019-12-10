flower(rose).
flower(petunia).
flower(daisy).
flower(phlox).
type(phlox, perennial).
type(petunia, annual).
type(rose, bush).
type(daisy, perennial).
type(daisy, annual).
perennial_garden(F):- flower(F), type(F,perennial).

location(new_york, 41, 74).
location(chicago, 42, 88).
location(tokyo, 35, 140).
location(oslo, 60, 11).
location(quito, 0, 80).
location(charleston,33,80).
location(cairo,30,30).
south_of(C1,C2):-location(C1,La1,Lo1), location(C2,La2,Lo2),La1>La2.

