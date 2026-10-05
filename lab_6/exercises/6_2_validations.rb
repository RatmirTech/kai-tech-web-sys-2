# Упражнения раздела 6.2: валидации пользователя.
#
#   bin/rails runner exercises/6_2_validations.rb

require_relative "sandbox"

sandbox do
  # 6.2.1: новый пользователь валиден (с паролем, он нужен модели после 6.3).
  user = User.new(user_attrs(name: "Example User", email: "user@example.com"))
  show "новый пользователь валиден", user.valid?

  # Созданный ранее (6.1.3) пользователь тоже валиден.
  created = User.create(user_attrs(name: "Michael Hartl", email: "michael@example.com"))
  show "созданный пользователь валиден", created.valid?

  # 6.2.2: пустой пользователь u невалиден, смотрим ошибки.
  u = User.new
  show "User.new.valid?", u.valid?
  show "u.errors.full_messages", u.errors.full_messages
  show "u.errors.messages - класс", u.errors.messages.class
  show "u.errors.messages[:email]", u.errors.messages[:email]

  # 6.2.3: слишком длинные имя и email.
  long = User.new(user_attrs(name: "a" * 51, email: "a" * 244 + "@example.com"))
  show "valid? с длинными name и email", long.valid?
  show "сообщения о длине", long.errors.full_messages

  # 6.2.5: без downcase проверка уникальности зависела бы от регистра;
  # с колбэком before_save адрес в базе всегда в нижнем регистре.
  first = User.create(user_attrs(name: "Example User", email: "Mixed@Example.COM"))
  show "email в базе после create", first.reload.email
  duplicate = User.new(user_attrs(name: "Other", email: "mixed@example.com"))
  show "дубликат (нижний регистр) валиден", duplicate.valid?
end

# 6.2.4: регулярное выражение на допустимых и недопустимых адресах
# (то, что в книге предлагается проверить на Rubular).
valid = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
           first.last@foo.jp alice+bob@baz.cn]
invalid = %w[user@example,com user_at_foo.org user.name@example.
             foo@bar_baz.com foo@bar+baz.com foo@bar..com]

puts
puts "VALID_EMAIL_REGEX: #{User::VALID_EMAIL_REGEX.inspect}"
valid.each { |a| show "допустимый #{a}", User::VALID_EMAIL_REGEX.match?(a) }
invalid.each { |a| show "недопустимый #{a}", User::VALID_EMAIL_REGEX.match?(a) }
