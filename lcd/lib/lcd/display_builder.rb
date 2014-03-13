module LCD
  class DisplayBuilder

    MIN_LINES = 5

    attr_reader :lcd_numbers

    def initialize(args)
      @number = args[:number]
      @size = args[:size]
      @lcd_numbers = ''
      generate_lcd
    end

    private
    def generate_lcd
      @lcd_numbers << lcd_body
    end

    def lcd_body
      "\n" << top_line << middle_top_line << middle_line << middle_bottom_line << bottom_line
    end

    def top_line
      @number.split.reduce('') { |acc, number| acc << number_top_line(number) }
    end

    def number_top_line(number)
      " - \n"
    end

    def middle_top_line
      @number.split.reduce('') { |acc, number| acc << number_middle_top_line(number) }
    end

    def number_middle_top_line(number)
      "| |\n"
    end

    def middle_line
      @number.split.reduce('') { |acc, number| acc << number_middle_line(number) }
    end

    def number_middle_line(number)
      "   \n"
    end

    def middle_bottom_line
      @number.split.reduce('') { |acc, number| acc << number_middle_bottom_line(number) }
    end

    def number_middle_bottom_line(number)
      "| |\n"
    end

    def bottom_line
      @number.split.reduce('') { |acc, number| acc << number_bottom_line(number) }
    end

    def number_bottom_line(number)
      " - \n"
    end
  end
end
