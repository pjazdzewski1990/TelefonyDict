require File.expand_path(File.dirname(__FILE__) + '/Telefony.rb')
#require '/Telefony.rb'

if ARGV.size < 2
  puts "Podaj wszystkie argumenty"
  return
end

t = Telefony.new()
found = t.search(ARGV[0], ARGV[1])
puts("Znaleziono:")
puts(found)
