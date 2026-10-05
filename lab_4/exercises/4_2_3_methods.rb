# Упражнения раздела 4.2.3: определение методов.
#
#   ruby exercises/4_2_3_methods.rb

# 1. Листинг 4.10: тестер палиндромов (FILL_IN заменён сравнением из 4.9).
def palindrome_tester(s)
  if s == s.reverse
    puts "It's a palindrome!"
  else
    puts "It's not a palindrome."
  end
end

# 2. Проверка на "racecar" и "onomatopoeia".
palindrome_tester("racecar")
palindrome_tester("onomatopoeia")

# 3. Метод печатает ответ, а не возвращает его, поэтому результат вызова - nil.
puts palindrome_tester("racecar").nil?
