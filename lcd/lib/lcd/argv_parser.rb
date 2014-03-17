module LCD
  module ARGVParser

    SIZE_OPTION = '-s'

    def self.options
      parse_args
      { number: @number, size: size }
    end

    private
    def self.parse_args
      parse_arg(ARGV.shift) until ARGV.empty?
    end

    def self.parse_arg(arg)
      if arg == SIZE_OPTION then @size = ARGV.shift.to_i
      else @number = arg
      end
    end

    def self.size
      @size || 2
    end
  end
end
