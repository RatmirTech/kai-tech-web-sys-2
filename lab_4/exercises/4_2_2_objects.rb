# Упражнения раздела 4.2.2: объекты и передача сообщений.
#
#   ruby exercises/4_2_2_objects.rb

# 1. Длина строки "racecar".
puts "racecar".length

# 2. Строка не меняется при переворачивании букв (reverse).
puts "racecar".reverse

# 3. Сравнение s и s.reverse оператором ==.
s = "racecar"
puts s == s.reverse

# 4. Листинг 4.9: простой тест палиндрома.
puts "It's a palindrome!" if s == s.reverse

# То же для "onomatopoeia": условие ложно, ничего не печатается.
s = "onomatopoeia"
puts "It's a palindrome!" if s == s.reverse
puts "(для \"#{s}\" тест палиндрома ничего не вывел)"
