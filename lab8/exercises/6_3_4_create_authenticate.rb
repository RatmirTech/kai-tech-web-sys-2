# Упражнения раздела 6.3.4: создание и аутентификация пользователя.
#
# В отличие от остальных скриптов, этот НЕ в песочнице: пользователь
# сохраняется в базе development, как в книге. Скрипт можно запускать
# повторно, второй раз пользователь не создаётся заново.
#
#   bin/rails runner exercises/6_3_4_create_authenticate.rb

require_relative "sandbox"

email = "michael@example.com"

User.create(name: "Michael Hartl", email: email,
            password: "foobar", password_confirmation: "foobar")

# 1. "Перезапуск консоли": находим пользователя заново.
user = User.find_by(email: email)
show "найденный пользователь", user.slice(:id, :name, :email)

# Хеш пароля bcrypt: сам пароль в базе не хранится.
show "password_digest начинается с", user.password_digest[0, 7]
show "password_digest содержит 'foobar'", user.password_digest.include?("foobar")

# authenticate: false для неверного пароля, объект пользователя для верного.
show "authenticate('not_the_right_password')", user.authenticate("not_the_right_password")
show "authenticate('foobaz')", user.authenticate("foobaz")
show "authenticate('foobar') == user", user.authenticate("foobar") == user
show "!!user.authenticate('foobar')", !!user.authenticate("foobar")

# 2. Смена имени присваиванием и save не сработает: у найденного из базы
#    пользователя нет виртуального атрибута password, а модель его требует.
user.name = "The Dude"
show "save после смены имени", user.save
show "почему не сработало", user.errors.full_messages

# 3. update_attribute пропускает валидации, поэтому имя меняется.
show "update_attribute(:name, ...)", user.update_attribute(:name, "Ratmir")
show "имя в базе", User.find_by(email: email).name
