module Kornic
  class DatePartial
    attr_reader :now
    attr_reader :offset
    attr_reader :exact_date
    attr_reader :year
    attr_reader :month
    attr_reader :day
    attr_reader :day_of_week
    attr_reader :context

    DAYS_OF_WEEK = {
      '월' => 1,
      '화' => 2,
      '수' => 3,
      '목' => 4,
      '금' => 5,
      '토' => 6,
      '일' => 0
    }

    def initialize(source, options = {})
      @source = source
      @now = Date.today
      @context = options[:context]
    end

    def guess
      apply_context

      scan_exact_date
      scan_month
      scan_day
      scan_offset
      scan_day_of_week

      if @exact_date
        @exact_date
      elsif @month && @day
        Date.new(@now.year, @month, @day)
      elsif @day
        @month = @now.month

        Date.new(@now.year, @month, @day)
      elsif @offset && @day_of_week
        @offset + @day_of_week
      elsif @day_of_week
        @offset = @now - @now.wday

        @offset + @day_of_week
      end
    end

    def apply_context
      if @context
        @month = @context.month
        @offset = @context.offset
      end
    end

    def scan_offset
      if @source =~ /이번 ?(달|주)?/
        @offset = @now - @now.wday
      elsif @source =~ /다다음 ?(달|주)?/
        if $1 && $1 == '달'
          @month = @now.month + 2
        else
          @offset = @now + 14 - @now.wday
        end
      elsif @source =~ /다음 ?(달|주)?/
        if $1 && $1 == '달'
          @month = @now.month + 1
        else
          @offset = @now + 7 - @now.wday
        end
      elsif @source =~ /(\d)(달|(개월)|주) 뒤|후/
        if $2 == '주'
          @offset = @now + ($1.to_i * 7) - @now.wday
        else
          @month = @now.month + $1.to_i
        end
      end
    end

    def scan_day_of_week
      day_of_week_regexp = Regexp.new("(#{DAYS_OF_WEEK.keys.join('|')})(요일)?")

      if !@day_of_week && @source =~ day_of_week_regexp
        @day_of_week = DAYS_OF_WEEK[$1]
      end
    end

    def scan_day
      if !@day && @source =~ /(\d+)일/
        @day = $1.to_i
      end
    end

    def scan_month
      if !@month && @source =~ /(\d+)월/
        @month = $1.to_i
      end
    end

    def scan_exact_date
      if @source =~ /오늘/
        @exact_date = @now
      elsif @source =~ /((내일)|낼)?모레/
        @exact_date = @now + 2
      elsif @source =~ /(내일)|낼/
        @exact_date = @now + 1
      elsif @source =~ /글피/
        @exact_date = @now + 3
      end
    end
  end
end
