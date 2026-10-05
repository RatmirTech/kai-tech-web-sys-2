# Раздел 4.4.5: класс User (листинг 4.17) и упражнения к нему.
#
#   ruby exercises/4_4_5_user_class.rb

require_relative "example_user"

example = User.new
p example
p example.first_name      # nil, так как attributes[:first_name] не задан

example.first_name = "Example"
example.last_name = "User"
example.email = "user@example.com"
puts example.formatted_email

# Хеш в аргументе initialize (фигурные скобки можно опустить).
user = User.new(first_name: "Michael", last_name: "Hartl", email: "mhartl@example.com")
p user
puts user.formatted_email

# Упражнения: full_name и alphabetical_name.
puts user.full_name
puts user.alphabetical_name

# 3. full_name.split совпадает с alphabetical_name.split(', ').reverse.
p user.full_name.split
p user.alphabetical_name.split(", ").reverse
puts user.full_name.split == user.alphabetical_name.split(", ").reverse
