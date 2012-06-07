require File.expand_path(File.dirname(__FILE__) + '/TelefonyNode.rb')

##
# Usuwa znaki nie bedace cyframi
##
def stripChars(string)
  return string.gsub(/[^0-9a-z ]/i, '')
end

if ARGV.size < 2
  puts "Podaj wszystkie argumenty: numer slownik [new]"
  return
end

t = TelefonyNode.new("")
##trzeci parametr decyduje czy tworzyc nowy slownik z pliku tekstowego
# czy raczej skorzystać ze skompilowanej wersji(wieksza wydajnosc)
if ARGV.size == 3 && ARGV.include?("new")
  t.indexFile(ARGV[1])
  #zapisz skompilowany plik slownikowy
  File.open(ARGV[1] + '.dict', 'w') do |f|  
    Marshal.dump(t, f)  
  end  
else
  #wykorzystaj binarny slownik
  File.open(ARGV[1]) do |f|  
    t = Marshal.load(f)  
  end 
end

#wynik zwracany jest jako lista - takie szukanie jest bardziej uniwersalne
found = t.search(stripChars(ARGV[0]))
found.each{ |f|
  puts(f)
}
