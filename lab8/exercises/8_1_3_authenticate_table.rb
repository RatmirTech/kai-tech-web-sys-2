# Упражнение раздела 8.1.3: проверка значений таблицы 8.2.
#
# Результат выражения user && user.authenticate(...):
#   пользователя нет  - при любом пароле  -> false (user == nil)
#   пользователь есть, пароль неверный    -> false
#   пользователь есть, пароль верный      -> true
#
#   bin/rails runner exercises/8_1_3_authenticate_table.rb

require_relative "sandbox"

password = "foobar"

sandbox do
  User.create(user_attrs(name: "Michael Example", email: "michael@example.com"))

  user = nil
  show "!!(user && user.authenticate('#{password}'))", !!(user && user.authenticate(password))

  user = User.first
  show "!!(user && user.authenticate('wrong'))", !!(user && user.authenticate("wrong"))
  show "!!(user && user.authenticate('#{password}'))", !!(user && user.authenticate(password))
end
