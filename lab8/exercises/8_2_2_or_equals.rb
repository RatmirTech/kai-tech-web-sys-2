# Упражнение раздела 8.2.2: current_user и ||=.
#
# 1. User.find_by по несуществующему id возвращает nil, а не бросает
#    исключение, как find.
# 2. Имитация листинга 8.17: хеш session и @current_user ||= find_by.
#    Первый вызов с пустой сессией даёт nil, после записи id в сессию
#    находится пользователь, а повторный вызов не обращается к базе -
#    возвращается запомненное значение.
#
#   bin/rails runner exercises/8_2_2_or_equals.rb

require_relative "sandbox"

sandbox do
  user = User.create(user_attrs(name: "Michael Example", email: "michael@example.com"))

  show "User.find_by(id: 999_999)", User.find_by(id: 999_999)

  session = {}
  session[:user_id] = nil
  show "@current_user ||= find_by, пустая сессия", @current_user ||= User.find_by(id: session[:user_id])
  session[:user_id] = user.id
  show "@current_user ||= find_by, id в сессии", @current_user ||= User.find_by(id: session[:user_id])
  show "повторный вызов отдаёт запомненное", @current_user
end
