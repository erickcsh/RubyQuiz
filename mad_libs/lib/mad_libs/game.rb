module MadLibs
  class Game

    def initialize(message)
      @message = message
    end

    def play
      substitute(retrieve_substitutions)
    end

    private
    def retrieve_substitutions
      @message.scan(/\(\([^)]*\)\)/).reduce([]) do |message, word|
        word.gsub!(/[()]/,'')
        message << ask_substitution(word)
      end
    end

    def ask_substitution(word)
        STDOUT.puts("Enter #{word}")
        STDIN.gets.chop
    end

    def substitute(substitutions)
      substitutions.reduce(@message) { |message, word| message.sub(/\(\([^)]*\)\)/, word) }
    end
  end
end
