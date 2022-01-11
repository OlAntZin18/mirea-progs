function lab_13(r::Robot)
    for i in ((Nord, Ost), (Nord, West), (Sud, Ost), (Sud, West))
        go_special!(r, i)
        return_special!(r, i)
    end
    putmarker!(r)
end

function return_special!(r,side) 
    while (ismarker(r)) 
        move!(r, inverse(side[1]))
        move!(r, inverse(side[2]))
    end
end

function go_special!(r, side::NTuple{2,HorizonSide})
    while isborder(r,side[1]) == false  &&   isborder(r,side[2]) == false
        move!(r,side[1])
        move!(r,side[2])
        putmarker!(r)
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))