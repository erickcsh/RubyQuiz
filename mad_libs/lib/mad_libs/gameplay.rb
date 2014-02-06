module MadLibs
  class Gameplay

    def start
      message = console.ask_message
      result = Game.new(message, console).play
      console.show_result(result)
    end

    private 
    def console
      Console.instance
    end
  end
end
