module MadLibs
  class Game

    def initialize(message, console)
      @message = message
      @console = console
      @reused_words = {}
    end

    def play
      substitute(retrieve_substitutions)
    end

    private
    def retrieve_substitutions
      @message.scan(/\(\([^)]*\)\)/).reduce([]) do |message, word|
        word.gsub!(/[()]/,'')
        message << find_substitution(word)
      end
    end

    def find_substitution(word)
      case
      when reusable?(word) then save_and_get_reusable(word)
      else find_not_declaring_substitution(word)
      end
    end

    def reusable?(word)
      word.match(/[^:]*:.*/)
    end

    def save_and_get_reusable(word)
          sym = word[/[^:]*/].to_sym
          word.sub!(/[^:]*:/,'')
          @reused_words[sym] = @console.ask_substitution(word)
    end

    def find_not_declaring_substitution(word)
      @reused_words[word.to_sym] || @console.ask_substitution(word)
    end

    def substitute(substitutions)
      substitutions.reduce(@message) { |message, word| message.sub(/\(\([^)]*\)\)/, word) }
    end
  end
end
