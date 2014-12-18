/*Armaan Bindra, Guanlun Mu and Stephen Akers*/
/*This Predicate insures that the start predicate is called immediately after consulting this file*/
:- initialization(start).
 
/*Predicate takes in a two dimensional list made up of 9 size 9 rows of the sudoku puzzle.
Maps the numbers in the domain 1 to 9, then checks whether every mapped 
value within every row is is unique
*/ 
solve(Rows) :-
    maplist(domain1to9, Rows),
    different(Rows),
    rowToColumn(Rows,Cols), 
    different(Cols),
    rowToBoxes(Rows,Boxes),
    different(Boxes),
    maplist(fd_labeling, Rows).
 
domain1to9(Rows) :- fd_domain(Rows,1,9).
different(Rows)  :- maplist(fd_all_different, Rows).

/* This Predicate takes a multidimensional list of rows and splits it into the 9 lists
representing the 9 boxes in a Sudoku puzzle*/
rowToBoxes(Rows,Boxes) :-
    maplist(splitInto3,Rows,Xs), rowToColumn(Xs,Ys)
  , concat(Ys,Zs), concat_map(splitInto3,Zs,Boxes). 

/*Takes a list and splits it into a multidimensional set of lists all size 3*/
splitInto3([X,Y,Z|L],[[X,Y,Z]|R]) :- 
    splitInto3(L,R).
    splitInto3([],[]).
 
concat_map(F,Xs,Ys) :- call(F,Xs,Zs), maplist(concat,Zs,Ys).
 
/*Flattens a multidimensional list into a single list*/
concat([],[]).
concat([X|Xs],Ys) :- append(X,Zs,Ys), concat(Xs,Zs).
 
/*This predicate takes all the different unique rows and creates a multi dimensional list of columns out it */
rowToColumn([],[]).
rowToColumn([[X]|Col], [[X|Row]]) :- rowToColumn(Col,[Row]).
rowToColumn([[X|Row]], [[X]|Col]) :- rowToColumn([Row],Col).
rowToColumn([[X|Row]|Xs], [[X|Col]|Ys]) :-
    maplist(bindHead, Row, Ys, YX)
  , maplist(bindHead, Col, Xs, XY)
  , rowToColumn(XY,YX).
    bindHead(H,[H|T],T).
    bindHead([],[],[]).

/*This is like the main function, the program reads in the puzzle and 
calls the solve predicate to solve it an eventually write it out to output.txt*/
start :- open('output.txt',write, Str),puzzle(Solution), solve(Solution),write(Str,Solution), halt.
/*This is the puzzle dynamically written into the pl file through our web interface before it is executed*/
puzzle([[_,2,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,2,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_]]).
