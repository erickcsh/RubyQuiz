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
                    '9' => { top: '-', middle_top: { left: '|', center: ' ', right: '|' }, middle: '-', middle_bottom: { left: ' ', center: ' ', right: '|' }, bottom: '-' } }

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
      "\n" << top_line << middle_top_line <<
      middle_line << middle_bottom_line << bottom_line
    end

    def top_line
      line = @number.split('').reduce('') { |acc, number| acc + number_top_line(number) }
      line << "\n"
    end

    def number_top_line(number)
      ' ' + resize(LCD_NUMBERS[number][:top]) + ' ' + resize(' ')
    end

    def middle_top_line
      line = @number.split('').reduce('') { |acc, number| acc + number_middle_top_line(number) }
      line << "\n"
      resize(line)
    end

    def number_middle_top_line(number)
      lcd = LCD_NUMBERS[number][:middle_top]
      lcd[:left] + resize(lcd[:center]) + lcd[:right] + resize(' ')
    end

    def middle_line
      line = @number.split('').reduce('') { |acc, number| acc + number_middle_line(number) }
      line << "\n"
    end

    def number_middle_line(number)
      ' ' + resize(LCD_NUMBERS[number][:middle]) + ' ' + resize(' ')
    end

    def middle_bottom_line
      line = @number.split('').reduce('') { |acc, number| acc + number_middle_bottom_line(number) }
      line << "\n"
      resize(line)
    end

    def number_middle_bottom_line(number)
      lcd = LCD_NUMBERS[number][:middle_bottom]
      lcd[:left] + resize(lcd[:center]) + lcd[:right] + resize(' ')
    end

    def bottom_line
      line = @number.split('').reduce('') { |acc, number| acc + number_bottom_line(number) }
      line << "\n"
    end

    def number_bottom_line(number)
      ' ' + resize(LCD_NUMBERS[number][:bottom]) + ' ' + resize(' ')
    end

    def resize(text)
      text * @size
    end
  end
end
