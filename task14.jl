function lab_14(r::Robot)  
    for i ∈ (Nord, Sud, West, Ost)
        go_to_border_come_back_and_return_distance!(r, i; markers = true, go_around_barriers = true)
    end
    putmarker!(r)
end