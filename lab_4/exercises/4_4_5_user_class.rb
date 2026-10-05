# Раздел 4.4.5: класс User (листинг 4.17).
#
#   ruby exercises/4_4_5_user_class.rb

require_relative "example_user"

example = User.new
p example
p example.name            # nil, так как attributes[:name] не задан

example.name = "Example User"
example.email = "user@example.com"
puts example.formatted_email

# Хеш в аргументе initialize (фигурные скобки можно опустить).
user = User.new(name: "Michael Hartl", email: "mhartl@example.com")
p user
puts user.formatted_email
