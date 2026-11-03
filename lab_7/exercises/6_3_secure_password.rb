# Упражнения разделов 6.3.2 и 6.3.3: безопасный пароль.
#
#   bin/rails runner exercises/6_3_secure_password.rb

require_relative "sandbox"

sandbox do
  # 6.3.2: пользователь с корректными именем и email, но без пароля, невалиден.
  user = User.new(name: "Michael Hartl", email: "michael@example.com")
  show "без пароля valid?", user.valid?
  show "сообщения об ошибках (нет пароля)", user.errors.full_messages

  # 6.3.3: пароль короче шести символов.
  user = User.new(name: "Michael Hartl", email: "michael@example.com",
                  password: "foo", password_confirmation: "foo")
  show "короткий пароль valid?", user.valid?
  show "сообщения об ошибках (короткий пароль)", user.errors.full_messages

  # Пароль из одних пробелов тоже не проходит.
  blank = User.new(name: "Michael Hartl", email: "michael@example.com",
                   password: " " * 6, password_confirmation: " " * 6)
  show "пароль из пробелов valid?", blank.valid?

  # Подтверждение, не совпадающее с паролем, - ещё одна ошибка.
  mismatch = User.new(name: "Michael Hartl", email: "michael@example.com",
                      password: "foobar", password_confirmation: "foobaz")
  show "подтверждение не совпадает valid?", mismatch.valid?
  show "сообщения (подтверждение)", mismatch.errors.full_messages
end
