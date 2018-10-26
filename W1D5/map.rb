class Map

  def initialize
    @map = []
  end

  def set(key, value)
    in_map = false
    @map.each do |array|
      if array[0] == key
        in_map = true
        array[1] = value
      end
    end
    @map << [key, value] if in_map == false
  end

  def get(key)
    @map.each do |array|
      if array[0] == key
        return array[1]
      end
    end

    nil
  end

  def delete(key)
    @map.each do |array|
      if array[0] == key
        @map.delete(array)
      end
    end

    @map
  end

  def show
    @map
  end
end
