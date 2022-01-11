#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля

#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы
function mark!(r)
    back!(r)
    putmarker!(r)
    while (!isborder(r,Sud) || !isborder(r,Nord)) && !isborder(r,Ost)
        for side in (Nord, Ost, Sud)
            if side == Ost
                putmarker!(r)
                move!(r,Ost)
            else
                while !isborder(r,side)
                    putmarker!(r)
                    move!(r,side)
                end
                if side == Sud && !isborder(r,Ost)
                    putmarker!(r)
                    move!(r,Ost)
                end
            end    
        end
    end
    putmarker!(r)
end
function back!(r)
    for side in (West,Sud)
        while !isborder(r,side)
            move!(r,side)
        end
    end
end
        