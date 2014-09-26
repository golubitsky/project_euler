CardValue = {    "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9, "T"=>10, "J"=>11, "Q"=>12, "K"=>13, "A"=>14}

HandValue = {    :high_card=>1, :pair=>2, :two_pair=>3, :three_kind=>4, :straight=>5, :flush=>6, :full_house=>7, :four_kind=>8, :straight_flush=>9, :royal_flush=>10}

class PokerHand
    include Comparable
    attr_accessor :value, :tie_breaker
    attr_reader :cards
    def initialize(arr)
        @cards = Hash.new{|h,k| h[k] = []}
        @cards[arr[0][1]] << CardValue[arr[0][0]]
        @cards[arr[1][1]] << CardValue[arr[1][0]]
        @cards[arr[2][1]] << CardValue[arr[2][0]]
        @cards[arr[3][1]] << CardValue[arr[3][0]]
        @cards[arr[4][1]] << CardValue[arr[4][0]]
        @cards.each {|k,v| v.sort!}
        self.find_value
    end

    def to_s
        "#{self.value} #{self.tie_breaker}"
    end

    def hash
        self.value.hash ^ self.tie_breaker.hash
    end

    def <=>(other_card)
        if self.value > other_card.value
          1
        elsif self.value < other_card.value
          -1
        else
            self.break_tie(other_card)
        end
    end

    def break_tie(other_card)
            i = 0
            while i < self.tie_breaker.length
                n = (self.tie_breaker[i] <=> other_card.tie_breaker[i])
                return n unless n == 0
                i += 1
            end
            0
    end

    def find_value
        n = self.royal_flush?
        if n
            self.value = HandValue[:royal_flush]
            self.tie_breaker = n
            return
        end

        n = self.straight_flush?
        if n
            self.value = HandValue[:straight_flush]
            self.tie_breaker = n
            return
        end

        n = self.four_kind?
        if n
            self.value = HandValue[:four_kind?]
            self.tie_breaker = n
            return
        end

        n = self.full_house?
        if n
            self.value = HandValue[:full_house]
            self.tie_breaker = n
            return
        end

        n = self.flush?
        if n
            self.value = HandValue[:flush]
            self.tie_breaker = n
            return
        end

        n = self.straight?
        if n
            self.value = HandValue[:straight]
            self.tie_breaker = n
            return
        end

        n = self.three_kind?
        if n
            self.value = HandValue[:three_kind]
            self.tie_breaker = n
            return
        end

        n = self.two_pair?
        if n
            self.value = HandValue[:two_pair]
            self.tie_breaker = n
            return
        end

        n = self.pair?
        if n
            self.value = HandValue[:pair]
            self.tie_breaker = n
            return
        end

        n = self.high_card?
        self.value = HandValue[:high_card]
        self.tie_breaker = n
    end

    def royal_flush?
        return false unless self.cards.length == 1
        return false unless self.cards.values.flatten == [*10..14]
        [1]
    end

    def straight_flush?
        return false if self.cards.length > 1
        cards = self.cards.values.flatten.sort
        i = 1
        while i < cards.length
            return false if (cards[i] - 1) != cards[i - 1]
            i += 1
        end
        [cards[-1]]
    end

    def four_kind?
        return false unless self.cards.length == 4
        arr = self.cards.values.flatten
        winning_card = nil
        tie_breaker = nil
        arr.each do |value|
            winning_card = value if arr.count(value)==4
            tie_breaker = value if arr.count(value)==1
        end
        return [winning_card, tie_breaker] if winning_card && tie_breaker
        false
    end

    def full_house?
        return false if self.cards.length < 3
        arr = self.cards.values.flatten.sort
        return [ arr[4], arr[0] ] if arr[0]==arr[1] && arr[2]==arr[3] && arr[3]==arr[4]
        return [ arr[0], arr[4] ] if arr[0]==arr[1] && arr[1]==arr[2] && arr[3]==arr[4]
    end

    def flush?
        return false if self.cards.length > 1
        [self.cards.values.flatten[-1]]
    end

    def straight?
        cards = self.cards.values.flatten.sort
        i = 1
        while i < cards.length
            return false if (cards[i] - 1) != cards[i - 1]
            i += 1
        end
        [cards[-1]]
    end

    def three_kind?
        return false unless self.cards.length > 2
        arr = self.cards.values.flatten.sort
        return [ arr[0] , arr[4], arr[3] ] if arr[0] == arr[1] && arr[1] == arr[2]
        return [ arr[1] , arr[4], arr[0] ] if arr[1] == arr[2] && arr[2] == arr[3]
        return [ arr[2] , arr[1], arr[0] ] if arr[2] == arr[3] && arr[3] == arr[4]
        false
    end

    def two_pair?
        arr = self.cards.values.flatten.sort
        return false unless arr.uniq.length == 3
        return [ arr[3] , arr[1], arr[4] ] if arr[0] == arr[1] && arr[2] == arr[3]
        return [ arr[4] , arr[1], arr[2] ] if arr[0] == arr[1] && arr[3] == arr[4]
        return [ arr[4] , arr[2], arr[0] ] if arr[1] == arr[2] && arr[3] == arr[4]
    end

    def pair?
        arr = self.cards.values.flatten.sort
        return false unless arr.uniq.length == 4
        pair = 0
        arr.each{ |card| pair = card if arr.count(card)==2 }
        arr -= [pair]
        [ pair, arr[2], arr[1], arr[0] ]
    end

    def high_card?
        arr = self.cards.values.flatten.sort
        arr.reverse
    end
end

result = 0
i = 0
File.open('./54_poker.txt', 'r') do |file|
  file.each_line do |line|
    i += 1
    arr = line.scan(/\w+/)
    player1 = PokerHand.new(arr[0,5])
    player2 = PokerHand.new(arr[5,5])
    result += 1 if player1 > player2
  end
end
p result
