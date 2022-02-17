current_path = './' + File.dirname(__FILE__)

require current_path + '/game.rb'
require current_path + '/print_result.rb'
require current_path + '/word_reader.rb'

PrintResult.clean
printer = PrintResult.new

reader = WordReader.new

slovo = reader.read_from_file(current_path + '/data/words.txt')

game = Game.new(slovo)

while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end
