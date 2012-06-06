class Telefony
  #  2 = A B C
  #  3 = D E F
  #  4 = G H I
  #  5 = J K L
  #  6 = M N O
  #  7 = P Q R S
  #  8 = T U V
  #  9 = W X Y Z
  ## offset dla poszczegolnych liter
  mapping = { 
    "A" => 2, "B" => 2, "C" => 2,
    "D" => 3, "E" => 3, "F" => 3,
    "G" => 4, "H" => 4, "I" => 4,
    "J" => 5, "K" => 5, "L" => 5,
    "M" => 6, "N" => 6, "O" => 6,
    "P" => 7, "R" => 7, "S" => 7, "Q" => 7,
    "T" => 8, "U" => 8, "V" => 8,
    "W" => 9, "X" => 9, "Y" => 9, "Z" => 9 }

  ##
  # Wyszukaj ciag "text" w slowniku (specjalnie przygotowanym pliku slownikowym) "dict"  
  ##  
  def search(text, dict)
    puts "Wyszukuje "+text+" w "+dict 
    search_for = stripChars(text)
    dictionary = File.open(dict)
    result = process(search_for, dictionary)
    dictionary.close
    return result
  end  
  
  ##
  # Dokunuje analizy pliku i zbiera wyniki
  ##
  def process(search, dict)
    ##anlizuj naglowek
    header = dict.readline.split(" ")
    
    #jesli przeszukalismy juz po calym slowie
    if search.length == 0
      #rekursywnie zbierz zawartosc naglowkow
      return extract(header)
    else
    end
    
  end
  
  ##
  # Usuwa niepotrzebne znaki z "text". 
  # Zostawia tylko liczby 
  ##
  def stripChars(text)
    return text.gsub(/[^0-9]/,'')
  end
end