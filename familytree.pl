% Sam Steinfeld
% PL7
% Description: This program allows the user to enter family member names into various predicate functions
%			   to see the relationships of members within the family tree. 
% Input: 	   The user can enter input on the console. The input is a predicate (eg. sibling(X,Y), spouse(X,Y), grandparent(X,Y), ect.) followed
%			   by a parameter. The X parameter represents the name of a family member who the user wishes to find a relative for. 
% Output:      The output is the person(s) that match the input for the X variable.

mother(michael,marie).
mother(mark,gail).
mother(sonja,christl).
mother(marie,elise).
mother(kim,gail).
mother(elke,christl).
mother(larry,beatrice).
mother(bruce,gail).
mother(max,elise).
mother(berta,elise).
mother(nicole,addie).
mother(reinhard,irmgard).
mother(hans,elise).
mother(meleita,addie).
mother(lisa,regina).
mother(norman,beatrice).
mother(joey,addie).
mother(trina,regina).
mother(george,beatrice).
mother(hanni,elise).
mother(mj,christine).
mother(christl,elise).
mother(edith,hanni).
mother(john,jennifer).
mother(luke,jen).
mother(adam,jen). 
mother(bettina,christl).
father(michael,larry).
father(mark,george).
father(sonja,heinz).
father(marie,bernhard).
father(kim,george).
father(elke,heinz).
father(larry,gerard).
father(bruce,george).
father(max,bernhard).
father(berta,bernhard).
father(nicole,norman).
father(reinhard,max).
father(hans,bernhard).
father(meleita,norman).
father(lisa,reinhard).
father(norman,gerard).
father(joey,norman).
father(trina,reinhard).
father(george,gerard).
father(hanni,bernhard).
father(mj,mark).
father(christl,bernhard).
father(edith,erwin).
father(john,bruce).
father(luke,michael).
father(adam,michael).
father(bettina,heinz).

parent(X,Y):-father(X,Y);mother(X,Y).

child(X,Y):-father(Y,X);mother(Y,X).

sibling(X,Y):-parent(X,Z), !, parent(Y,Z), X\=Y.

grandfather(X,Y):-father(Z,Y), parent(X,Z).

grandmother(X,Y):-mother(Z,Y), parent(X,Z).

grandparent(X,Z):-parent(X,Y), parent(Y,Z).

cousin(X,Y):-parent(X, A), sibling(A, B), child(B, Y).

auntoruncle(X,Y):-cousin(X,Z), parent(Z,Y); parent(X,Z), sibling(Z,Y).

spouse(X,Y):-parent(Z,X), parent(Z,Y), X\=Y, !.

nieceornephew(X,Y):-sibling(X,Z), child(Z,Y);spouse(X,A), sibling(A,B), child(B,Y).

greatgrandmother(X,Y):-grandparent(X,Z), mother(Z,Y).

greatgrandfather(X,Y):-grandparent(X,Z), father(Z,Y).
