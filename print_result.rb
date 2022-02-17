class PrintResult

  def initialize
    @status_image = []
    current_path = File.dirname(__FILE__)
    counter = 0
    while counter <= 7 do
      file_name = current_path + "/image/#{counter}.txt"
      begin
        f = File.new(file_name)
        @status_image << f.read
      rescue
        @status_image << "\n [Изображение не найдено] \n"
      end
      counter += 1
    end
  end

  def print_status(game)
    PrintResult.clean
    puts "\n Слово #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(', ')}"
    print_viselitsya(game.errors)
    puts game.errors
    if game.errors >= 7
      puts 'вы проиграли :('
      game.status = -1
      puts 'Загаданное слово было: ' + game.slovo.to_s

    else
      if game.letters.uniq.size == game.good_letters.size
        puts 'Вы выиграли!'
        game.status = 1
       else
      puts 'У вас осталось попыток: ' + (7 - game.errors).to_s
      end
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ''

    for letter in letters do
      if good_letters.include? letter
      result += letter + ' '
       else
         result += '_ '
      end
    end
    return result
  end

def print_viselitsya(errors)
  puts @status_image[errors]
end

def PrintResult.clean
  system "clear" or system "cls"
end
end
