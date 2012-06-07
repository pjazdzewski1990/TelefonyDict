require File.expand_path(File.dirname(__FILE__) + '/TelefonyNode.rb')
#require '/Telefony.rb'

def stripChars(string)
  return string.gsub(/[^0-9a-z ]/i, '')
end

if ARGV.size < 2
  puts "Podaj wszystkie argumenty"
  return
end

t = TelefonyNode.new("")
t.indexFile("dict.txt")
t.search("8353")

t.search(stripChars(ARGV[0]))
#puts("Znaleziono:")
#puts(found)
