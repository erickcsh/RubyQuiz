module LCD
  class DisplayBuilder

    BORDER = '|'
    SEPARATOR = '-'
    SPACE = ' '
    LCD_NUMBERS = { '0' => { top: SEPARATOR, middle_top: { left: BORDER, center: SPACE, right: BORDER }, middle: SPACE, middle_bottom: { left: BORDER, center: SPACE, right: BORDER }, bottom: SEPARATOR },
                    '1' => { top: SPACE, middle_top: { left: SPACE, center: SPACE, right: BORDER }, middle: SPACE, middle_bottom: { left: SPACE, center: SPACE, right: BORDER }, bottom: SPACE },
                    '2' => { top: SEPARATOR, middle_top: { left: SPACE, center: SPACE, right: BORDER }, middle: SEPARATOR, middle_bottom: { left: BORDER, center: SPACE, right: SPACE }, bottom: SEPARATOR },
                    '3' => { top: SEPARATOR, middle_top: { left: SPACE, center: SPACE, right: BORDER }, middle: SEPARATOR, middle_bottom: { left: SPACE, center: SPACE, right: BORDER }, bottom: SEPARATOR },
                    '4' => { top: SPACE, middle_top: { left: BORDER, center: SPACE, right: BORDER }, middle: SEPARATOR, middle_bottom: { left: SPACE, center: SPACE, right: BORDER }, bottom: SPACE },
                    '5' => { top: SEPARATOR, middle_top: { left: BORDER, center: SPACE, right: SPACE }, middle: SEPARATOR, middle_bottom: { left: SPACE, center: SPACE, right: BORDER }, bottom: SEPARATOR },
                    '6' => { top: SEPARATOR, middle_top: { left: BORDER, center: SPACE, right: SPACE }, middle: SEPARATOR, middle_bottom: { left: BORDER, center: SPACE, right: BORDER }, bottom: SEPARATOR },
                    '7' => { top: SEPARATOR, middle_top: { left: SPACE, center: SPACE, right: BORDER }, middle: SPACE, middle_bottom: { left: SPACE, center: SPACE, right: BORDER }, bottom: SPACE },
                    '8' => { top: SEPARATOR, middle_top: { left: BORDER, center: SPACE, right: BORDER }, middle: SEPARATOR, middle_bottom: { left: BORDER, center: SPACE, right: BORDER }, bottom: SEPARATOR },
                    '9' => { top: SEPARATOR, middle_top: { left: BORDER, center: SPACE, right: BORDER }, middle: SEPARATOR, middle_bottom: { left: SPACE, center: SPACE, right: BORDER }, bottom: SEPARATOR } }

    attr_reader :lcd_numbers

    def initialize(args)
      @number = args[:number]
      @size = args[:size]
      @lcd_numbers = "\n" << top_line << middle_top_line <<
      middle_line << middle_bottom_line << bottom_line
    end

    def respond_to?(method, include_private = false)
      super || respond_to_line?(method)
    end

    private
    def respond_to_line?(method)
      name = method.to_s
      name =~ /_line$/
    end

    def method_missing(method, *args)
      name = method.to_s
      super unless name =~ /_line$/
      name.gsub!(/_line$/, '')
      call_method_missing(name, *args)
    end

    def call_method_missing(name, *args)
      name =~ /^number_/ ? number_line(name, args[0]) : create_line(name)
    end

    def number_line(name, number)
      name.gsub!(/^number_/, '')
      if middle_top_or_middle_bottom?(name) then border_line(name.to_sym, number)
      else divider_line(name.to_sym, number)
      end
    end

    def border_line(name, number)
      lcd = LCD_NUMBERS[number][name]
      create_number_line(lcd[:left], lcd[:center], lcd[:right])
    end

    def divider_line(name, number)
      create_number_line(SPACE, LCD_NUMBERS[number][name], SPACE)
    end

    def middle_top_or_middle_bottom?(name)
      %w(middle_top middle_bottom).include?(name)
    end

    def create_line(name)
      size = define_size(name)
      line = @number.split('').reduce('') { |acumulator, number| acumulator + call_line_method(name, number) }
      line << "\n"
      resize(line, size)
    end

    def call_line_method(name, number)
      method = "number_#{name}_line"
      send(method.to_sym, number)
    end

    def define_size(name)
      middle_top_or_middle_bottom?(name) ? @size : 1
    end

    def create_number_line(left, center, right)
      left + resize(center) + right + resize(SPACE)
    end

    def resize(text, size = @size)
      text * size
    end
  end
end
