# Упражнения раздела 4.3.3: хеши и символы.
#
#   ruby exercises/4_3_3_hashes.rb

# 1. Хеш с ключами 'one', 'two', 'three' и испанскими значениями.
spanish = { "one" => "uno", "two" => "dos", "three" => "tres" }
spanish.each do |key, value|
  puts "'#{key}' in Spanish is '#{value}'"
end

# 2. Три хеша person1..person3 и вложенный хеш params.
person1 = { first: "Michael", last: "Hartl" }
person2 = { first: "Anna", last: "Hartl" }
person3 = { first: "Peter", last: "Hartl" }

params = {}
params[:father] = person1
params[:mother] = person2
params[:child] = person3

p params
puts params[:father][:first]
puts params[:mother][:first]
puts params[:child][:first]

# 3. Хеш пользователя с "хешем пароля" - случайной строкой из 16 строчных букв.
user = {
  name: "Ratmir",
  email: "ratmir@example.com",
  password_digest: Array.new(16) { ("a".."z").to_a.sample }.join
}
p user
puts user[:password_digest].length

# 4. Метод merge: значение для общего ключа берётся из аргумента.
p({ "a" => 100, "b" => 200 }.merge({ "b" => 300 }))
