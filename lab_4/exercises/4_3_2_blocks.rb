# Упражнения раздела 4.3.2: блоки.
#
#   ruby exercises/4_3_2_blocks.rb

# 1. Первые 17 степеней двойки: диапазон 0..16.
(0..16).each { |i| puts 2**i }

# 2. yeller: массив символов -> строка в верхнем регистре.
def yeller(characters)
  characters.map(&:upcase).join
end

puts yeller(["o", "l", "d"])    # "OLD"

# 3. shuffled_subdomain: восемь букв из полностью перемешанного алфавита.
def shuffled_subdomain
  ("a".."z").to_a.shuffle[0..7].join
end

puts shuffled_subdomain

# 4. Листинг 4.12: перемешивание букв строки (вопросительные знаки заменены).
def string_shuffle(s)
  s.split("").shuffle.join
end

puts string_shuffle("foobar")
