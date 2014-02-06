module MadLibs
  class Game

    def initialize(message)
      @message = message
      @symbols = {}
    end

    def play
      substitute(retrieve_substitutions)
    end

    private
    def retrieve_substitutions
      @message.scan(/\(\([^)]*\)\)/).reduce([]) do |message, word|
        word.gsub!(/[()]/,'')
        if(word.match(/[^:]*:.*/))
          sym = word[/[^:]*/]
          print sym
          word.sub!(/[^:]*:/,'')
          word = ask_substitution(word)
          @symbols[sym.to_sym] = word
        else
          if(@symbols[word.to_sym])
            word = @symbols[word.to_sym]
          else
            word = ask_substitution(word)
          end
        end
        message << word
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
