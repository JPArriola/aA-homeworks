def sluggish_oct(arr)
  arr.each_with_index do |fish1, idx1|
    max_length = true
    arr.each_with_index do |fish2, idx2|
      next if idx1==idx2

      max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length == true
  end
end

tiles_arr = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_arr)
  tiles_arr.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end
