
class LettersMapping
  #  2 = A B C
  #  3 = D E F
  #  4 = G H I
  #  5 = J K L
  #  6 = M N O
  #  7 = P Q R S
  #  8 = T U V
  #  9 = W X Y Z
  #przeksztalcenie cyfra -> potencjalne litery
  @@mapping = {
    "2" => ["A", "B", "C"],
    "3" => ["D", "E", "F"],
    "4" => ["G", "H", "I"],
    "5" => ["J", "K", "L"],
    "6" => ["M", "N", "O"],
    "7" => ["P", "Q", "R", "S"],
    "8" => ["T", "U", "V"],
    "9" => ["W", "X", "Y", "Z"]
  }
  
  def self.mapping
      @@mapping
  end
end

##
# Struktura drzewiasta do przechowywania slownika
# oraz do wyszukiwania zawartcyh w nim slow
##
class TelefonyNode
  @value = ""    # wartosc tego wezla (litera)
  @children = {} # hash-mapa na dzieci tego noda
                # klucz to litera, wartosc to node
                # nil oznacza brak powiazania
  #  2 = A B C
  #  3 = D E F
  #  4 = G H I
  #  5 = J K L
  #  6 = M N O
  #  7 = P Q R S
  #  8 = T U V
  #  9 = W X Y Z
  #przeksztalcenie cyfra -> potencjalne litery
#  @mapping = { }
  
  #konstruktor
  #obiekty powinny byc niezmienne, 
  # jedyny sposob na ich inicjalizacje to konstruktor 
  def initialize(word)
      @value = word
      @children = {}
#      @mapping = {
#        "2" => ["A", "B", "C"],
#        "3" => ["D", "E", "F"],
#        "4" => ["G", "H", "I"],
#        "5" => ["J", "K", "L"],
#        "6" => ["M", "N", "O"],
#        "7" => ["P", "Q", "R", "S"],
#        "8" => ["T", "U", "V"],
#        "9" => ["W", "X", "Y", "Z"]
#      }
  end
  
  ##
  # Dodaj slowo do struktury drzewiastej
  ## 
  def addWord(word)
    #jesli slowo sie skonczylo, to koncz
    if word.length == 0
      return
    end 
    #dodaj dziecko, jesli nie istnieje
    letter = word[0].chr
    @children[letter] = TelefonyNode.new(letter) unless @children[letter]!=nil
    #wywoluj rekursywnie
    @children[letter].addWord(word[1, word.length])
  end
 
  ##
  # Przeszukuje drzewo w poszukiwaniu slowa "word"
  # (znak po znaku).
  # Znaleziona czesc slowa akumuluje w "acc"
  ## 
  def search(word, acc="")
    #jesli slowo sie skonczylo, to koncz
    if word.length == 0
      ##puts(acc)
      return acc
    end 
    
    #lista wynikow
    result = []
    #rozwazana litera
    letter = word[0].chr
    #wywoluj rekursywnie, dla kazdego istniejacego dziecka
    defined? LettersMapping.mapping[letter].each{ |l|
      #dla wybranego dziecka wywolujemy szukanie krotszego slowa, jesli dziecko istnieje
      result << @children[l].search(word[1, word.length], acc+l) unless @children[l]==nil
    }
    #zamieniamy liste list na liste
    return result.flatten
  end
  
  ##
  # Indeksuj plik o nazwie "fileName"
  ##
  def indexFile(fileName)
    file = File.open(fileName)
    begin
      while (line = file.gets)
        line.upcase!
        addWord(line)
      end
    rescue EOFError
    end
    file.close
  end
  
end