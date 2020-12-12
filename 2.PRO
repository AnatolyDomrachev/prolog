predicates
    input
    test_trap(real,real,real,real,real,real,real,real,real)
    test_trap2(real,real,real)
    test_cross(real,real,real,real,real,real,real,real,real,real,real,real,real)
    test_paral(real,real,real,real,real,real,real,real,real)
    state_trap1(real)
    state_trap2(real,real,real,real,real,real,real,real,real)
    get_line(real,real,real,real,real,real,real,real,real)
 

clauses
    input:-
        write("Enter trapecia, 4 point x and y "),
        readreal(X1),
        readreal(Y1),
        readreal(X2),
        readreal(Y2),
        readreal(X3),
        readreal(Y3),
        readreal(X4),
        readreal(Y4),
        test_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R1),
        state_trap1(R1),
        state_trap2(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R1).

    get_line(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R):-
        write("Enter line, 2 point x and y "),
        readreal(X01),
        readreal(Y01),
        readreal(X02),
        readreal(Y02),
        test_cross(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X01,Y01,X02,Y02,R).
    
    test_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R):-
        test_paral(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R1),
        test_paral(X2,Y2,X3,Y3,X4,Y4,X1,Y1,R2),
        test_trap2(R1,R2,R).
        
    test_trap2(R1,R2,R):-
        R1 = R2,
        R = 0;
        R1 <> R2,
        R = 1.

    test_cross(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X01,Y01,X02,Y02,R):-
        write(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X01,Y01,X02,Y02,R).

    test_paral(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R):-
        Y1 - Y2 = 0 ,
        Y3 - Y4 = 0 ,
        R = 1;
        Y1 - Y2 <> 0 ,
        Y3 - Y4 <> 0 ,
        (X1 - X2) / (Y1 - Y2) = (X3 - X4) / (Y3 - Y4), 
            R = 1;
        Y1 - Y2 <> 0 ,
        Y3 - Y4 <> 0 ,
        (X1 - X2) / (Y1 - Y2) <> (X3 - X4) / (Y3 - Y4), 
            R = 0.        
        
    state_trap1(R):-
        R - 1 = -1,
        write("Ne trapecia"),nl.

    state_trap2(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R):-
        R -1 = 0,
        get_line(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R).

goal
    input.
 
