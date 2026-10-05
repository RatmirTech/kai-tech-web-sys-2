# Упражнения раздела 4.4.3: изменение встроенных классов.
#
#   ruby exercises/4_4_3_modifying_builtin.rb

class String
  # Returns true if the string is its own reverse.
  def palindrome?
    self == self.reverse
  end

  # 2. Возвращает строку с перемешанными буквами (листинг 4.16).
  def shuffle
    self.split("").shuffle.join
  end
end

# 1. "racecar" - палиндром, "onomatopoeia" - нет, "Malayalam" - да после downcase.
puts "racecar".palindrome?
puts "onomatopoeia".palindrome?
puts "Malayalam".palindrome?
puts "Malayalam".downcase.palindrome?

# 2. Перемешивание: те же буквы в другом порядке.
shuffled = "foobar".shuffle
puts shuffled
puts shuffled.chars.sort == "foobar".chars.sort

# 3. shuffle работает и без self.
class String
  def shuffle
    split("").shuffle.join
  end
end

puts "foobar".shuffle.chars.sort == "foobar".chars.sort
