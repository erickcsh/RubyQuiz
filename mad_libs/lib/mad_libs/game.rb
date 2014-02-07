module MadLibs
  class Game

    SUBSTITUTABLE = /\(\([^)]*\)\)/
    REUSABLE = /[^:]*:.*/
    REUSABLE_NAME = /[^:]*/
    REUSABLE_START = /[^:]*:/

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
      @message.scan(SUBSTITUTABLE).reduce([]) do |message, word|
        word.gsub!(/[()]/,'')
        message << find_substitution(word)
      end
    end

    def find_substitution(word)
      if reusable?(word) then save_and_get_reusable(word)
      else find_not_declaring_substitution(word)
      end
    end

    def reusable?(word)
      word.match(REUSABLE)
    end

    def save_and_get_reusable(word)
          sym = word[REUSABLE_NAME].to_sym
          word.sub!(REUSABLE_START, '')
          @reused_words[sym] = @console.ask_substitution(word)
    end

    def find_not_declaring_substitution(word)
      @reused_words[word.to_sym] || @console.ask_substitution(word)
    end

    def substitute(substitutions)
      substitutions.reduce(@message) { |message, word| message.sub(SUBSTITUTABLE, word) }
    end
  end
end
