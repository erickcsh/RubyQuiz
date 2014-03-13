module LCD
  class DisplayBuilder

    LCD_NUMBERS = { '0' => { top: '-', middle_top: { left: '|', center: ' ', right: '|' }, middle: ' ', middle_bottom: { left: '|', center: ' ', right: '|' }, bottom: '-' },
                    '1' => { top: ' ', middle_top: { left: ' ', center: ' ', right: '|' }, middle: ' ', middle_bottom: { left: ' ', center: ' ', right: '|' }, bottom: ' ' },
                    '2' => { top: '-', middle_top: { left: ' ', center: ' ', right: '|' }, middle: '-', middle_bottom: { left: '|', center: ' ', right: ' ' }, bottom: '-' },
                    '3' => { top: '-', middle_top: { left: ' ', center: ' ', right: '|' }, middle: '-', middle_bottom: { left: ' ', center: ' ', right: '|' }, bottom: '-' },
                    '4' => { top: ' ', middle_top: { left: '|', center: ' ', right: '|' }, middle: '-', middle_bottom: { left: ' ', center: ' ', right: '|' }, bottom: ' ' },
                    '5' => { top: '-', middle_top: { left: '|', center: ' ', right: ' ' }, middle: '-', middle_bottom: { left: ' ', center: ' ', right: '|' }, bottom: '-' },
                    '6' => { top: '-', middle_top: { left: '|', center: ' ', right: ' ' }, middle: '-', middle_bottom: { left: '|', center: ' ', right: '|' }, bottom: '-' },
                    '7' => { top: '-', middle_top: { left: ' ', center: ' ', right: '|' }, middle: ' ', middle_bottom: { left: ' ', center: ' ', right: '|' }, bottom: ' ' },
                    '8' => { top: '-', middle_top: { left: '|', center: ' ', right: '|' }, middle: '-', middle_bottom: { left: '|', center: ' ', right: '|' }, bottom: '-' },
                    '9' => { top: '-', middle_top: { left: '|', center: ' ', right: '|' }, middle: '-', middle_bottom: { left: ' ', center: ' ', right: '|' }, bottom: ' ' } }

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
      "\n" << top_line << "\n" << middle_top_line << "\n" << middle_line << "\n" << middle_bottom_line << "\n" << bottom_line << "\n"
    end

    def top_line
      @number.split.reduce('') { |acc, number| acc + number_top_line(number) }
    end

    def number_top_line(number)
      ' ' + LCD_NUMBERS[number][:top] + ' '
    end

    def middle_top_line
      @number.split.reduce('') { |acc, number| acc + number_middle_top_line(number) }
    end

    def number_middle_top_line(number)
      lcd = LCD_NUMBERS[number][:middle_top]
      lcd[:left] + lcd[:center] + lcd[:right]
    end

    def middle_line
      @number.split.reduce('') { |acc, number| acc + number_middle_line(number) }
    end

    def number_middle_line(number)
      ' ' + LCD_NUMBERS[number][:middle] + ' '
    end

    def middle_bottom_line
      @number.split.reduce('') { |acc, number| acc + number_middle_bottom_line(number) }
    end

    def number_middle_bottom_line(number)
      lcd = LCD_NUMBERS[number][:middle_bottom]
      lcd[:left] + lcd[:center] + lcd[:right]
    end

    def bottom_line
      @number.split.reduce('') { |acc, number| acc + number_bottom_line(number) }
    end

    def number_bottom_line(number)
      ' ' + LCD_NUMBERS[number][:bottom] + ' '
    end
  end
end
