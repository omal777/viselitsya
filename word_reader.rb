# sozdaem generator slov
class WordReader
  def read_from_file(file_name)
    begin
      f = File.new(file_name)
      lines = f.readlines
      f.close
      lines.sample.chomp
    rescue SystemCallError 
      abort 'Файл не найден'
    end
  end
end
