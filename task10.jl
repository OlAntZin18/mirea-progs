#ДАНО: Робот - в юго-западном углу поля, на котором расставлено 
#некоторое количество маркеров

#РЕЗУЛЬТАТ: Функция вернула значение средней температуры 
#всех замаркированных клеток
function step(r)
    num = 0
    begin!(r)
    while !isborder(r,Ost)
        move!(r,Ost)
        num+=1
    end
    return num
    begin!(r)
end

function begin!(r)
    for side in (West,Sud)
        while !isborder(r,side)
            move!(r,side)
        end
    end
end
function find_marker(r)
    num_steps_max=1
    side=Nord
    if !isborder(r,side)
        while ismarker(r)==false
            for _ in 1:2
                find_marker(r,side,num_steps_max)
                side=next(side)
            end
            num_steps_max+=1
        end
    else
        while isborder(r,side) == true
            side = next(side)
        end
    end
end
function find_marker(r,side,num_steps_max)
    for _ in 1:num_steps_max
        if ismarker(r)
            return true
        end
        move!(r,side)
    end
end
next(side::HorizonSide)=HorizonSide(mod(Int(side)+1,4))
function main!(r)
    a = step(r)
    b = []
    num_step_max = 0
    i = 0
    while num_step_max!=a
        find_marker(r)
        push!(b,temperature(r))
    end
    for i in 1:b.size
        sum += b[i]
    end
    sr = sum//b.size
    return sr
end

    




