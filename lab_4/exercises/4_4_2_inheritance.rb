# Упражнения раздела 4.4.2: наследование классов.
#
#   ruby exercises/4_4_2_inheritance.rb

# Иерархия классов: цепочка superclass до BasicObject.
def hierarchy(klass)
  chain = [klass]
  chain << chain.last.superclass while chain.last.superclass
  chain.join(" < ")
end

# 1. Иерархия для диапазона, хеша и символа.
puts hierarchy((1..2).class)
puts hierarchy({}.class)
puts hierarchy(:name.class)

# Листинг 4.15: Word наследуется от String, self - сама строка.
class Word < String
  # Returns true if the string is its own reverse.
  def palindrome?
    self == self.reverse
  end
end

s = Word.new("level")
puts s.palindrome?
puts s.length
puts hierarchy(s.class)

# 2. Метод работает и без self перед reverse.
class Word < String
  def palindrome?
    self == reverse
  end
end

puts s.palindrome?
puts Word.new("foobar").palindrome?
