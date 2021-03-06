predicates // Это аналог объявлений аналога функций
    input
    test_trap(real,real,real,real,real,real,real,real,real)
    test_trap2(real,real,real)
    test_cross_trap(real,real,real,real,real,real,real,real,real,real,real,real)
    test_line(real,real,real,real,real,real,real,real)
    test_paral(real,real,real,real,real,real,real,real,real)
    test3(real,real)
    state_trap(real,real,real,real,real,real,real,real,real)
    get_line(real,real,real,real,real,real,real,real)
    test2(integer, integer, real,real,real,real,real,real,real,real)
    get_point(real,real,real,real,real,real,real,real)
    get_point2(real,real,real,real,real,real,real,real,real,real)

clauses //  Это аналог реализации аналога функций
    input:- //Ввод данных
        write("Enter trapecia, 4 point x and y "),nl,
        readreal(X1),//Ввод Х1 типа real что-то вроде double в C++
        readreal(Y1),
        readreal(X2),
        readreal(Y2),
        readreal(X3),
        readreal(Y3),
        readreal(X4),
        readreal(Y4),
        test_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R), // Вызов как-бы функции Результат выполнения будет записан в R
        state_trap(R,X1,Y1,X2,Y2,X3,Y3,X4,Y4).// Вызов как-бы функции Результат выполнения будет записан в R

    get_line(X1,Y1,X2,Y2,X3,Y3,X4,Y4):- //Принимает уже введённые координаты трапeции, вводит координаты прямой
        write("Enter line, 2 point x and y "),nl,
        readreal(X01),
        readreal(Y01),
        readreal(X02),
        readreal(Y02),
        test_cross_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X01,Y01,X02,Y02).
    
    test_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R):- 
        test_paral(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R1),// Вызов как-бы функции Результат выполнения будет записан в R1
        test_paral(X2,Y2,X3,Y3,X4,Y4,X1,Y1,R2),// Вызов как-бы функции Результат выполнения будет записан в R2
        test_trap2(R1,R2,R).// Вызов как-бы функции Результат выполнения будет записан в R
        
    test_trap2(R1,R2,R):-//проверка, что R1 = R2 Результат выполнения будет записан в R
        R1 = R2,
        R = 0;
        R1 <> R2,
        R = 1.

    test_cross_trap(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X01,Y01,X02,Y02):-// Проверяется пересечение прямой с каждой стороной трапeции
        test_line(X1,Y1,X2,Y2,X01,Y01,X02,Y02),//С первой стороной
        test_line(X2,Y2,X3,Y3,X01,Y01,X02,Y02),
        test_line(X3,Y3,X4,Y4,X01,Y01,X02,Y02),
        test_line(X4,Y4,X1,Y1,X01,Y01,X02,Y02).

    test_line(X1,Y1,X2,Y2,X01,Y01,X02,Y02):-//// Проверяется пересечение прямой со стороной трапeции
        nl,//вывод пустой строки
        %write(X1," ",Y1," ",X2," ",Y2," "),nl,// Строка закомментирована, может использоваться для отладки
        %write(X01," ",Y01," ",X02," ",Y02),nl,nl,// Строка закомментирована, может использоваться для отладки

        test_paral(X1,Y1,X2,Y2,X01,Y01,X02,Y02,R1),//Проверяем параллельность стороны и прямой Результат выполнения будет записан в R1
        test_paral(X1,Y1,X01,Y01,X01,Y01,X02,Y02,R2),//Проверяем параллельность одной из точек стороны и прямой Результат выполнения будет записан в R2
        %write("R1 R2 ", R1, R2),nl,nl, // Строка закомментирована, может использоваться для отладки
        test2(R1, R2, X1,Y1,X2,Y2,X01,Y01,X02,Y02).

    get_point(X1,Y1,X2,Y2,X3,Y3,X4,Y4):-//Ищу точки пересечения прямой, образованной стороной и точками по примеру http://algolist.ru/maths/geom/intersect/lineline2d.php
        nl,
        %write(X1," ",Y1," ",X2," ",Y2," , ",X3," ",Y3," ",X4," ",Y4," CROSS LINE: "),
        Ua = ((X4-X3)*(Y1-Y3)-(Y4-Y3)*(X1-X3))/((Y4-Y3)*(X2-X1)-(X4-X3)*(Y2-Y1)),
        %%%%%%Ub = ((X2-X1)*(Y1-Y3)-(Y2-Y1)*(X1-X3))/((Y4-Y3)*(X2-X1)-(X4-X3)*(Y2-Y1)),
        Xc = X1+Ua*(X2-X1),
        Yc = Y1+Ua*(Y2-Y1),
        get_point2(X1,Y1,X2,Y2,X3,Y3,X4,Y4,Xc,Yc).

    get_point2(X1,Y1,X2,Y2,X3,Y3,X4,Y4,Xc,Yc):-//Проверяю что точка пересечения на отрезке-стороне трапеции
        Xc >= X1 , Xc <= X2,//Для этого X должен быть между X точек стороны
        write(X1," ",Y1," ",X2," ",Y2," , ",X3," ",Y3," ",X4," ",Y4," ", " CROSS: ", Xc, " ", Yc),nl;
        Xc < X1 ,
        write(X1," ",Y1," ",X2," ",Y2," , ",X3," ",Y3," ",X4," ",Y4," ", " No cross"),nl;
        Xc > X2 ,
        write(X1," ",Y1," ",X2," ",Y2," , ",X3," ",Y3," ",X4," ",Y4," ", " No cross"),nl.

    test2(1, 1, X1,Y1,X2,Y2,X01,Y01,X02,Y02):- //4 функции test2. Эта будет выполнена, если первый 2 аргумента 1 и 1. Это значит, что сторона на линии
		 write(X1," ",Y1," ",X2," ",Y2," , ",X01," ",Y01," ",X02," ",Y02," ", " Lay on side"),nl.
    test2(1, 0, X1,Y1,X2,Y2,X01,Y01,X02,Y02):-//4 функции test2. Эта будет выполнена, если первый 2 аргумента 1 и 0. Это значит, что нет пересечений
		 write(X1," ",Y1," ",X2," ",Y2," , ",X01," ",Y01," ",X02," ",Y02," ", " No cross"),nl.
    test2(0, 1, X1,Y1,X2,Y2,X01,Y01,X02,Y02):-//4 функции test2. Эта будет выполнена, если первый 2 аргумента 0 и 1. Это значит, что нет могут быть  пересеченяя
		 get_point(X1,Y1,X2,Y2,X01,Y01,X02,Y02).
    test2(0, 0, X1,Y1,X2,Y2,X01,Y01,X02,Y02):-//4 функции test2. Эта будет выполнена, если первый 2 аргумента 0 и 0. Это значит, что нет могут быть  пересеченяя
		 get_point(X1,Y1,X2,Y2,X01,Y01,X02,Y02).


    test_paral(X1,Y1,X2,Y2,X3,Y3,X4,Y4,R):-//Проверяю параллельность прямых, образованных двумя отрезками по примеру www.webmath.ru/poleznoe/formules_4_7.php
        A1 = X1-X2,//координаты вектора это разность координат точек
        A2 = Y1-Y2,//координаты вектора это разность координат точек
        B1 = X3-X4,
        B2 = Y3-Y4,
        Cs = (A1 * B1 + A2 * B2)/ sqrt(A1*A1 + A2 * A2) / sqrt(B1*B1 + B2 * B2),//Косинус угда между векторами
        Ac = abs(Cs),//модуль косинуса
        test3(Ac,R).

    test3(Ac,R):-////Проверяем модуль косинуса. Результат выполнения будет записан в R
        Ac >= 1, R = 1;
        Ac < 1, R = 0.


    state_trap(0,X1,Y1,X2,Y2,X3,Y3,X4,Y4):- //Этих функций 2 штуки (вторая следующая). Если первый аргументом при вызове 0 - вызывается первая, если 1, то вторая
        write(X1,Y1,X2,Y2,X3,Y3,X4,Y4), nl ,
        write("Ne trapecia"),nl.

    state_trap(1,X1,Y1,X2,Y2,X3,Y3,X4,Y4):-//Этих функций 2 штуки (вторая предыдущая). Если первый аргументом при вызове 0 - вызывается первая, если 1, то вторая
        get_line(X1,Y1,X2,Y2,X3,Y3,X4,Y4).

goal //Аналог функции main в С++
    input.
 
