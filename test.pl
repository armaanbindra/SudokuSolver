/*:-initialization(main).*/

main(L):-
    open('myFile.txt',read, Str),
    read_file(Str,L),
    close(Str).
	
read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L).