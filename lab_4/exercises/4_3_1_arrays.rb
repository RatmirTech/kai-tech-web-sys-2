# Упражнения раздела 4.3.1: массивы и диапазоны.
#
#   ruby exercises/4_3_1_arrays.rb

def palindrome_tester(s)
  if s == s.reverse
    puts "It's a palindrome!"
  else
    puts "It's not a palindrome."
  end
end

# 1. Разделить строку по запятой с пробелом.
a = "A man, a plan, a canal, Panama".split(", ")
p a

# 2. Склеить элементы массива без разделителя.
s = a.join
p s

# 3. Разбить по пробелам и склеить обратно без разделителя.
s = s.split.join
p s
palindrome_tester(s)            # не палиндром: мешает регистр букв
palindrome_tester(s.downcase)   # с downcase - палиндром

# 4. Элемент с индексом 7 в диапазоне букв a-z и в перевёрнутом диапазоне.
letters = ("a".."z").to_a
puts letters[7]
puts letters.reverse[7]
