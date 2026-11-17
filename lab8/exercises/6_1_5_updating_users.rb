# Упражнения раздела 6.1.5: обновление объектов User.
#
#   bin/rails runner exercises/6_1_5_updating_users.rb

require_relative "sandbox"

sandbox do
  user = User.create(user_attrs(name: "Michael Hartl", email: "michael@example.com"))

  # 1. Обновление имени присваиванием и save.
  user.name = "Michael Hartl Jr."
  show "user.save после присваивания имени", user.save
  show "user.reload.name", user.reload.name

  # Без save изменение не попадает в базу: reload его отменяет.
  user.email = "foo@bar.com"
  show "user.email до reload", user.email
  show "user.reload.email", user.reload.email

  # 2. Обновление email через update.
  show "user.update(email: ...)", user.update(email: "mhartl@example.net")
  show "user.email", user.email

  # update принимает хеш атрибутов; update_attribute меняет один и пропускает валидации.
  show "user.update(name:, email:)", user.update(name: "The Dude", email: "dude@abides.org")
  show "user.update_attribute(:name, ...)", user.update_attribute(:name, "El Duderino")
  show "user.name", user.name

  # 3. Волшебные колонки тоже можно менять напрямую.
  user.created_at = 1.year.ago
  user.save
  show "user.reload.created_at.year (год назад)", user.reload.created_at.year
  show "год назад == текущий год - 1", user.created_at.year == Time.current.year - 1
end
