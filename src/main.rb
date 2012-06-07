require File.expand_path(File.dirname(__FILE__) + '/TelefonyNode.rb')
#require '/Telefony.rb'

if ARGV.size < 2
  puts "Podaj wszystkie argumenty"
  return
end

t = TelefonyNode.new("")
t.addWord("QWERTY")
t.search("793789")
t.addWord("QWE")
t.search("793")
t.addWord("ABC")
t.search("222")
t.addWord("AABB")
t.search("2222")

t.search(ARGV[0])
#puts("Znaleziono:")
#puts(found)
