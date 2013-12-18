module TimeLord
  class Scale
    include Units

    attr_accessor :absolute

    def initialize(absolute)
      self.absolute = absolute
    end

    def to_value
      timemap.first
    end

    def to_unit
      timemap.last
    end

    private

    def timemap
      case absolute
      when 0               then [absolute, "秒"]
      when SECOND...MINUTE then [absolute, pluralized_word("秒", plurality?(absolute)) || "秒"]
      when MINUTE...HOUR   then as(MINUTE, "分钟")
      when HOUR...DAY      then as(HOUR, "小时")
      when DAY...WEEK      then as(DAY, "天")
      when WEEK...MONTH    then as(WEEK, "星期")
      when MONTH...YEAR    then as(MONTH, "月")
      else                      as(YEAR, "年")
      end
    end

    def as(unit, word)
      [count(unit), pluralized_word(word, plurality?(count(unit))) || word]
    end

    def count(unit)
      absolute / unit
    end

    def pluralized_word(word, plural)
      # Chinese has no pluralization!
      word
      # word += "s" if plural
    end

    def plurality?(count)
      count > 1 || count.zero?
    end
  end
end
