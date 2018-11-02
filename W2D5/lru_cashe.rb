class LRUCache
    def initialize(size)
      @size = size
      @cashe = []
    end

    def count
      @cashe.count
    end

    def add(el)
      if @cashe.include?(el)
        @cashe.delete(el)
        @cashe << el
      elsif @cashe >= size
        @cashe.shift
        @cashe << el
      else
        @cashe << el
      end
    end

    def show
      p @cashe
      nil
    end

    private
    # helper methods go here!

  end
