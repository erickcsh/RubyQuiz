require 'singleton'

module MadLibs
  class Console
    include Singleton

    def ask_substitution(word)
      read_input("Enter #{word}")
    end

    def ask_message
      read_input("Enter message")
    end

    def show_result(result)
      read_input(result)
    end

    private
    def read_input(message)
      STDOUT.puts(message)
      STDIN.gets.chop
    end
  end
end
