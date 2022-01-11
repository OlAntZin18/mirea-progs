function movement!(r,side)
    while !isborder(r,side)
        move!(r,side)
    end
end
function begin!(r)
    for side in (West,Sud)
        while !isborder(r,side)
            move!(r,side)
        end
    end
end
function chess!(r,num_step)
    if num_step % 2 == 0
        putmarker!(r)
    end
end
function chehov!(r,num_step)
    num_step = 0
    for side in (Ost, West)
        while !isborder(r,side)
            chess!(r,num_step)
            num_step += 1
            move!(r,side)
        end
        num_step += 1
        move!(r,Nord)
    end
end        
function go!(r)
    begin!(r)
    num_step = 0
    while (!isborder(r,West) || !isborder(r,Ost)) && !isborder(r,Nord)
        chehov!(r,num_step)
    end
    side = West
    while !isborder(r,inverse(side))
        chess!(r,num_step)
        num_step += 1
        move!(r,inverse(side))
    end
    while !isborder(r,side) 
        chess!(r,num_step)
        num_step += 1
        move!(r,side)
    end
end
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))


