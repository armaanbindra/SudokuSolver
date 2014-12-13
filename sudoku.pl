:-initialization(start).

start:-main(L,Solution).

main(L,Solution):-
    open('myFile.txt',read, Str),
    read_file(Str,L),
    close(Str),
	sudoku(L,Solution),
	write(Solution).
	
read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L).

sudoku(Puzzle, Solution) :-
    Solution = Puzzle,
    Puzzle = [S11, S12, S13, S14, S15, S16, S17, S18, S19,
              S21, S22, S23, S24, S25, S26, S27, S28, S29,
              S31, S32, S33, S34, S35, S36, S37, S38, S39,
			  S41, S42, S43, S44, S45, S46, S47, S48, S49,
			  S51, S52, S53, S54, S55, S56, S57, S58, S59,
			  S61, S62, S63, S64, S65, S66, S67, S68, S69,
			  S71, S72, S73, S74, S75, S76, S77, S78, S79,
			  S81, S82, S83, S84, S85, S86, S87, S88, S89,
			  S91, S92, S93, S94, S95, S96, S97, S98, S99
			  ],

    Row1 = [S11, S12, S13, S14,S15, S16, S17, S18,S19],
    Row2 = [S21, S22, S23, S24,S25, S26, S27, S28,S29],
    Row3 = [S31, S32, S33, S34,S35, S36, S37, S38,S39],
	
    Row4 = [S41, S42, S43, S44,S45, S46, S47, S48,S49],
	Row5 = [S51, S52, S53, S54,S55, S56, S57, S58,S59],
	Row6 = [S61, S62, S63, S64,S65, S66, S67, S68,S69],
	
	Row7 = [S71, S72, S73, S74,S75, S76, S77, S78,S79],
	Row8 = [S81, S82, S83, S84,S85, S86, S87, S88,S89],
	Row9 = [S91, S92, S93, S94,S95, S96, S97, S98,S99],

	Col1 = [S11,S12,S13,S14,S15,S16,S17,S18,S19],
	Col2 = [S21,S22,S23,S24,S25,S26,S27,S28,S29],
	Col3 = [S31,S32,S33,S34,S35,S36,S37,S38,S39],
	Col4 = [S41,S42,S43,S44,S45,S46,S47,S48,S49],
	Col5 = [S51,S52,S53,S54,S55,S56,S57,S58,S59],
	Col6 = [S61,S62,S63,S64,S65,S66,S67,S68,S69],
	Col7 = [S71,S72,S73,S74,S75,S76,S77,S78,S79],
	Col8 = [S81,S82,S83,S84,S85,S86,S87,S88,S89],
	Col9 = [S91,S92,S93,S94,S95,S96,S97,S98,S99],

    Square1 = [S11, S12, S13, S21, S22, S23, S31, S32, S33],
    Square2 = [S14, S15, S16, S24, S25, S26, S34, S35, S36],
	Square3 = [S17, S18, S19, S27, S28, S29, S37, S38, S39],
	
    Square4 = [S41, S42, S43, S51, S52, S53, S61, S62, S63],
    Square5 = [S44, S45, S46, S54, S55, S56, S64, S65, S66],
	Square6 = [S47, S48, S49, S57, S58, S59, S67, S68, S69],
	
    Square7 = [S71, S72, S73, S81, S82, S83, S91, S92, S93],
    Square8 = [S74, S75, S76, S84, S85, S86, S94, S95, S96],
	Square9 = [S77, S78, S79, S87, S88, S89, S97, S98, S99],

    Sets = [Row1, Row2, Row3, Row4,Row5, Row6, Row7, Row8, Row9,
           Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9,
           Square1, Square2, Square3, Square4, Square5, Square6, Square7, Square8, Square9],

    maplist(permutation(['1','2','3','4','5','6','7','8','9']), Sets).