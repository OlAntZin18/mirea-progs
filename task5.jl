#ДАНО: Робот - в произвольной клетке 
#ограниченного прямоугольного поля,
# на котором могут находиться также внутренние
# прямоугольные перегородки 
#(все перегородки изолированы друг от друга, 
#прямоугольники могут вырождаться в отрезки)
#РЕЗУЛЬТАТ: Робот - в исходном положении и
# в углах поля стоят маркеры
function movement!(r,side)
    while !isborder(r,side)
        move!(r,side)
    end
end
function go!(r)
    a1 = 0
    a2 = 0
    a3 = 0
    a4 = 0
    while (a1 != 1) || (a2 != 1) || (a3 != 1) || (a4 != 1)
        for side in (Ost,Sud,West,Nord)
            movement!(r,side)
            if (isborder(r,West) && isborder(r,Sud) && (a1!=1))==true
                putmarker!(r)
                a1=1
            end
            if (isborder(r,West) && isborder(r,Nord) && (a2!=1))==true
                putmarker!(r)
                a2=1
            end
            if (isborder(r,Ost) && isborder(r,Nord) && (a3!=1))==true
                putmarker!(r)
                a3=1
            end
            if (isborder(r,Ost) && isborder(r,Sud) && (a4!=1))==true
                putmarker!(r)
                a4=1
            end
        end
    end
end




