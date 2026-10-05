# Упражнения раздела 6.1.3: создание объектов User.
#
#   bin/rails runner exercises/6_1_3_creating_users.rb

require_relative "sandbox"

users_before = User.count

sandbox do
  user = User.new(user_attrs(name: "Michael Hartl", email: "michael@example.com"))
  show "User.new(...).valid?", user.valid?
  show "user.id до save", user.id
  show "user.created_at до save", user.created_at
  show "user.save", user.save
  show "user.id после save", user.id

  # 1. user.name и user.email - строки.
  show "user.name.class", user.name.class
  show "user.email.class", user.email.class

  # 2. created_at и updated_at - временные метки с часовым поясом.
  show "user.created_at.class", user.created_at.class
  show "user.updated_at.class", user.updated_at.class

  # create объединяет new и save, возвращает объект, а не true.
  another = User.create(user_attrs(name: "A Nother", email: "another@example.org"))
  foo = User.create(user_attrs(name: "Foo", email: "foo@bar.com"))
  show "User.count после двух create", User.count

  # destroy - обратная операция: объект удалён из базы, но остаётся в памяти.
  foo.destroy
  show "User.count после foo.destroy", User.count
  show "foo.destroyed?", foo.destroyed?
  show "foo.name (объект ещё в памяти)", foo.name
  show "another.persisted?", another.persisted?
end

show "число пользователей до и после sandbox совпадает", User.count == users_before
