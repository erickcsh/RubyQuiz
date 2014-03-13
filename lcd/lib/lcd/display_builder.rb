module LCD
  class DisplayBuilder

    attr_reader :lcd_numbers

    def initialize(args)
      @number = args[:number]
      @size = args[:size]
      @lcd_numbers = ''
      generate_lcd
    end

    private
    def generate_lcd

    end
  end
end
