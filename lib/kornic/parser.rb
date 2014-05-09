module Kornic
  class Parser
    def initialize(source, options = {})
      @source = source
    end

    def parse
      scan_preposition
    end

    def scan_preposition
      if @source =~ /(로?부터)|(에서)|(~)/
        before = Kornic::DatePartial.new($`)
        after = Kornic::DatePartial.new($', context: before)

        [before, after]
      elsif @source =~ /(이?랑)|,|및|와|과/
        before = Kornic::DatePartial.new($`)
        after = Kornic::DatePartial.new($', context: before)

        [before, after]
      else
        [Kornic::DatePartial.new(@source)]
      end
    end

    def scan
      scan_preposition
    end
  end
end
