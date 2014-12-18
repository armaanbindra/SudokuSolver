:-initialization(start).

start:-main(L,Solution).

main(L,Solution):-
    open('input.txt',read, Str),
    read_file(Str,L),
    close(Str),
    open('output.txt',write,Str2),
	convertList(L,Solution),
    solve(Solution).

	
read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L).

solve(Rows) :-
    maplist(domain_1_9, Rows)
  , different(Rows)
  , transpose(Rows,Cols), different(Cols)
  , blocks(Rows,Blocks) , different(Blocks)
  , maplist(fd_labeling, Rows)
  .
 
domain_1_9(Rows) :- fd_domain(Rows,1,9).
different(Rows)  :- maplist(fd_all_different, Rows).
 
blocks(Rows,Blocks) :-
    maplist(split3,Rows,Xs), transpose(Xs,Ys)
  , concat(Ys,Zs), concat_map(split3,Zs,Blocks)
  . % where
    split3([X,Y,Z|L],[[X,Y,Z]|R]) :- split3(L,R).
    split3([],[]).
 
 
% utils/list
concat_map(F,Xs,Ys) :- call(F,Xs,Zs), maplist(concat,Zs,Ys).
 
concat([],[]).
concat([X|Xs],Ys) :- append(X,Zs,Ys), concat(Xs,Zs).
 
transpose([],[]).
transpose([[X]|Col], [[X|Row]]) :- transpose(Col,[Row]).
transpose([[X|Row]], [[X]|Col]) :- transpose([Row],Col).
transpose([[X|Row]|Xs], [[X|Col]|Ys]) :-
    maplist(bind_head, Row, Ys, YX)
  , maplist(bind_head, Col, Xs, XY)
  , transpose(XY,YX)
  . % where
    bind_head(H,[H|T],T).
    bind_head([],[],[]).
 
 
% tests
test([ [_,_,3,_,_,_,_,_,_]
     , [4,_,_,_,8,_,_,3,6]
     , [_,_,8,_,_,_,1,_,_]
     , [_,4,_,_,6,_,_,7,3]
     , [_,_,_,9,_,_,_,_,_]
     , [_,_,_,_,_,2,_,_,5]
     , [_,_,4,_,7,_,_,6,8]
     , [6,_,_,_,_,_,_,_,_]
     , [7,_,_,6,_,_,5,_,_]
     ]).
 

convertList( [S11, S12, S13, S14, S15, S16, S17, S18, S19,
              S21, S22, S23, S24, S25, S26, S27, S28, S29,
              S31, S32, S33, S34, S35, S36, S37, S38, S39,
			  S41, S42, S43, S44, S45, S46, S47, S48, S49,
			  S51, S52, S53, S54, S55, S56, S57, S58, S59,
			  S61, S62, S63, S64, S65, S66, S67, S68, S69,
			  S71, S72, S73, S74, S75, S76, S77, S78, S79,
			  S81, S82, S83, S84, S85, S86, S87, S88, S89,
			  S91, S92, S93, S94, S95, S96, S97, S98, S99
			  ],L2):- L2 = [
							[S11, S12, S13, S14,S15, S16, S17, S18,S19],
							[S21, S22, S23, S24,S25, S26, S27, S28,S29],
						    [S31, S32, S33, S34,S35, S36, S37, S38,S39],
						    [S41, S42, S43, S44,S45, S46, S47, S48,S49],
							[S51, S52, S53, S54,S55, S56, S57, S58,S59],
							[S61, S62, S63, S64,S65, S66, S67, S68,S69],
							[S71, S72, S73, S74,S75, S76, S77, S78,S79],
							[S81, S82, S83, S84,S85, S86, S87, S88,S89],
							[S91, S92, S93, S94,S95, S96, S97, S98,S99]
							].