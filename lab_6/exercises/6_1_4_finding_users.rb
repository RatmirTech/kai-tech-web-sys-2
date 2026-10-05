# Упражнения раздела 6.1.4: поиск объектов User.
#
#   bin/rails runner exercises/6_1_4_finding_users.rb

require_relative "sandbox"

sandbox do
  user = User.create(user_attrs(name: "Michael Hartl", email: "michael@example.com"))
  User.create(user_attrs(name: "A Nother", email: "another@example.org"))
  foo = User.create(user_attrs(name: "Foo", email: "foo@bar.com"))
  foo_id = foo.id
  foo.destroy

  show "User.find(id первого).name", User.find(user.id).name

  # find для несуществующего id возбуждает исключение.
  begin
    User.find(foo_id)
  rescue ActiveRecord::RecordNotFound => e
    show "User.find(удалённый id)", e.class
  end

  show "User.find_by(email: ...).name", User.find_by(email: "michael@example.com").name

  # 1. Поиск по имени; find_by_name - старый стиль, работает так же.
  show "User.find_by(name: ...).id", User.find_by(name: "Michael Hartl").id
  show "User.find_by_name(...).id", User.find_by_name("Michael Hartl").id

  show "User.first.name", User.first.name

  # 2. User.all ведёт себя как массив, но на самом деле это ActiveRecord::Relation.
  show "User.all.class", User.all.class

  # 3. У результата работает length (утиная типизация).
  show "User.all.length", User.all.length
end
