#ДАНО: На ограниченном внешней прямоугольной рамкой поле имеется
# ровно одна внутренняя перегородка в форме прямоугольника. 
#Робот - в произвольной клетке поля между внешней и 
#внутренней перегородками. 
#РЕЗУЛЬТАТ: Робот - в исходном положении 
#и по всему периметру внутренней перегородки 
#поставлены маркеры.
function try_move!(robot, side)::Bool
    if isborder(robot, side) # - это вызов виртуальной функции (кторая реально будет определена в каком-то из производных типов)
        false
    else
        move!(robot, side) # - это вызов виртуальной функции (кторая реально будет определена в каком-то из производных типов)
        true
    end
end
function proverka(r)
    for side in (Ost,West,Sud,Nord)
        if try_move(r,side) == false
            return false
        else
            return true
        end
    end
end
next(side::HorizonSide)=HorizonSide(mod(Int(side)+1,4))
function find_border(r)
    num_steps_max=1
    side=Nord
    while isborder(r, side)==false
        for _ in 1:2
            fborder(r,side,num_steps_max)
            side=next(side)
        end
        num_steps_max+=1
    end
end

function fborder(r,side,num_steps_max)
    for _ in 1:num_steps_max
        if isborder(r,side) && proverka(r) == false
            return nothing
        end
        move!(r,side)
    end
end