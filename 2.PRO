predicates
    input
    test_trap(real,real,real,real,real,real,real,real,real)
    test_trap2(real,real,real)
    test_cross_trap(real,real,real,real,real,real,real,real,real,real,real,real)
    test_line(real,real,real,real,real,real,real,real)
    test_paral(real,real,real,real,real,real,real,real,real)
    state_trap(real,real,real,real,real,real,real,real,real)
    get_line(real,real,real,real,real,real,real,real)
    test2(integer, integer, real,real,real,real,real,real,real,real)
    get_point(real,real,real,real,real,real,real,real)
    get_point2(real,real,real,real,real,real,real,real,real,real)

clauses
    input:-
        write("Enter trapecia, 4 point x and y "),nl,
        readreal(X1),
        readreal(Y1),
        readreal(X2),
        readreal(Y2),
        readreal(X3),
        readreal(Y3),
        readreal(X4),
        readreal(Y4),
        test_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R),
        state_trap(R,X1,Y1,X2,Y2,X3,Y3,X4,Y4).

    get_line(X1,Y1,X2,Y2,X3,Y3,X4,Y4):-
        write("Enter line, 2 point x and y "),nl,
        readreal(X01),
        readreal(Y01),
        readreal(X02),
        readreal(Y02),
        test_cross_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X01,Y01,X02,Y02).
    
    test_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R):-
        test_paral(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R1),
        test_paral(X2,Y2,X3,Y3,X4,Y4,X1,Y1,R2),
        test_trap2(R1,R2,R).
        
    test_trap2(R1,R2,R):-
        R1 = R2,
        R = 0;
        R1 <> R2,
        R = 1.

    test_cross_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X01,Y01,X02,Y02):-
        test_line(X1,Y1,X2,Y2,X01,Y01,X02,Y02),
        test_line(X2,Y2,X3,Y3,X01,Y01,X02,Y02),
        test_line(X3,Y3,X4,Y4,X01,Y01,X02,Y02),
        test_line(X4,Y4,X1,Y1,X01,Y01,X02,Y02).

    test_line(X1,Y1,X2,Y2,X01,Y01,X02,Y02):-
        nl,
        %write(X1," ",Y1," ",X2," ",Y2," "),nl,
        %write(X01," ",Y01," ",X02," ",Y02),nl,nl,

        test_paral(X1,Y1,X2,Y2,X01,Y01,X02,Y02,R1),
        test_paral(X1,Y1,X01,Y01,X01,Y01,X02,Y02,R2),
        %write("R1 R2 ", R1, R2),nl,nl,
        test2(R1, R2, X1,Y1,X2,Y2,X01,Y01,X02,Y02).

    get_point(X1,Y1,X2,Y2,X3,Y3,X4,Y4):-
        nl,
        %write(X1," ",Y1," ",X2," ",Y2," , ",X3," ",Y3," ",X4," ",Y4," CROSS LINE: "),
        Ua = ((X4-X3)*(Y1-Y3)-(Y4-Y3)*(X1-X3))/((Y4-Y3)*(X2-X1)-(X4-X3)*(Y2-Y1)),
        %%%%%%Ub = ((X2-X1)*(Y1-Y3)-(Y2-Y1)*(X1-X3))/((Y4-Y3)*(X2-X1)-(X4-X3)*(Y2-Y1)),
        Xc = X1+Ua*(X2-X1),
        Yc = Y1+Ua*(Y2-Y1),
        get_point2(X1,Y1,X2,Y2,X3,Y3,X4,Y4,Xc,Yc).

    get_point2(X1,Y1,X2,Y2,X3,Y3,X4,Y4,Xc,Yc):-
        Xc >= X1 , Xc <= X2, 
        write(X1," ",Y1," ",X2," ",Y2," , ",X3," ",Y3," ",X4," ",Y4," ", " CROSS: ", Xc, " ", Yc),nl;
        Xc < X1 ,
        write(X1," ",Y1," ",X2," ",Y2," , ",X3," ",Y3," ",X4," ",Y4," ", " No cross"),nl;
        Xc > X2 ,
        write(X1," ",Y1," ",X2," ",Y2," , ",X3," ",Y3," ",X4," ",Y4," ", " No cross"),nl.

    test2(1, 1, X1,Y1,X2,Y2,X01,Y01,X02,Y02):-
		 write(X1," ",Y1," ",X2," ",Y2," , ",X01," ",Y01," ",X02," ",Y02," ", " Lay on side"),nl.
    test2(1, 0, X1,Y1,X2,Y2,X01,Y01,X02,Y02):-
		 write(X1," ",Y1," ",X2," ",Y2," , ",X01," ",Y01," ",X02," ",Y02," ", " No cross"),nl.
    test2(0, 1, X1,Y1,X2,Y2,X01,Y01,X02,Y02):-
		 get_point(X1,Y1,X2,Y2,X01,Y01,X02,Y02).
    test2(0, 0, X1,Y1,X2,Y2,X01,Y01,X02,Y02):-
		 get_point(X1,Y1,X2,Y2,X01,Y01,X02,Y02).


    test_paral(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R):-
        Y1 - Y2 = 0 ,
        Y3 - Y4 = 0 ,
        R = 1;

        Y1 - Y2 <> 0 ,
        Y3 - Y4 = 0 ,
        R = 0;

        Y1 - Y2 = 0 ,
        Y3 - Y4 <> 0 ,
        R = 0;

        Y1 - Y2 <> 0 ,
        Y3 - Y4 <> 0 ,
        (X1 - X2) / (Y1 - Y2) = (X3 - X4) / (Y3 - Y4), 
            R = 1;

        Y1 - Y2 <> 0 ,
        Y3 - Y4 <> 0 ,
        (X1 - X2) / (Y1 - Y2) <> (X3 - X4) / (Y3 - Y4), 
            R = 0.        

    state_trap(0,X1,Y1,X2,Y2,X3,Y3,X4,Y4):-
        write(X1,Y1,X2,Y2,X3,Y3,X4,Y4), nl ,
        write("Ne trapecia"),nl.

    state_trap(1,X1,Y1,X2,Y2,X3,Y3,X4,Y4):-
        get_line(X1,Y1,X2,Y2,X3,Y3,X4,Y4).

goal
    input.
 
