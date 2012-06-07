
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
  @mapping = {
    "2" => ["A", "B", "C"],
    "3" => ["D", "E", "F"],
    "4" => ["G", "H", "I"],
    "5" => ["J", "K", "L"],
    "6" => ["M", "N", "O"],
    "7" => ["P", "Q", "R", "S"],
    "8" => ["T", "U", "V"],
    "9" => ["W", "X", "Y", "Z"]
  }
  
  #konstruktor
  #obiekty powinny byc niezmienne, 
  # jedyny sposob na ich inicjalizacje to konstruktor 
  def initialize(word)
      @value = word
      @children = {}
      @mapping = {
        "2" => ["A", "B", "C"],
        "3" => ["D", "E", "F"],
        "4" => ["G", "H", "I"],
        "5" => ["J", "K", "L"],
        "6" => ["M", "N", "O"],
        "7" => ["P", "Q", "R", "S"],
        "8" => ["T", "U", "V"],
        "9" => ["W", "X", "Y", "Z"]
      }
  end
  
  ##
  # Dodaj slowo do struktury drzewiastej
  ## 
  def addWord(word)
    #jesli slowo sie skonczylo, to koncz
    if word.length == 0
      #children[""] = Telefony.new("")
      return
    end 
    #dodaj dziecko
    letter = word[0].chr
    if @children[letter]==nil
      @children[letter] = TelefonyNode.new(letter)
    end
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
      puts(acc)
      return
    end 
    #rozwazana litera
    letter = word[0].chr
    #wywoluj rekursywnie, dla kazdego istniejacego dziecka
    @mapping[letter].each{ |l|
      ##puts(l)
      if @children[l]!=nil
        @children[l].search(word[1, word.length], acc+l)
      end
    }
  end
  
  ##
  # Indeksuj plik o nazwie "fileName"
  ##
  def indexFile(fileName)
    file = File.open(fileName)
    line = file.readline
    while line != nil do
      ##line = capitalize(line)
      addWord(line)
      line = file.readline
    end
    file.close
  end
  
end