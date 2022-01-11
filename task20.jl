function lab_20(r)
    go_to_west_south_corner_and_return_path!(r; go_around_barriers = true)

    my_ans = 0
    border_now = false
    side = East
    while !isborder(r, Nord)
        
        while !isborder(r, side)
            my_ans, border_now = find_special!(r, my_ans, border_now, Nord)
            move!(r,side)
        end
        my_ans, border_now = find_special!(r, my_ans, border_now, Nord)

        side = inverse_side(side)
        move!(r, Nord)
    end
    return my_ans
end

function find_special!(r::Robot, my_ans::Int, border_now::Bool, side::HorizonSide)
    if isborder(r, side)
        border_now = true
    end
    if !isborder(r, side) && border_now
        border_now = false
        my_ans += 1
    end
    return my_ans, border_now
end
