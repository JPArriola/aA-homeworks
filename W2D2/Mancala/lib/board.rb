class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new(4)}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx1|
      cup.length.times.with_index do |el, idx2|
        @cups[idx1][idx2] = :stone
      end
    end

    @cups[6] = []
    @cups[13] = []
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos].length
    @cups[start_pos] = []
    i = start_pos
    while stone_count > 0
      i += 1
      i += 1 if i == 13 && current_player_name == @name1
      i += 1 if i == 6 && current_player_name == @name2
      @cups[(i) % 13] << :stone

      stone_count -= 1
    end

    render
    next_turn(i % 13)
  end

  def next_turn(ending_cup_idx)
    :switch if @cups[ending_cup_idx].count == 1
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?}
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    if @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end
