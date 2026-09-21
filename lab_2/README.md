# Лабораторная работа №2

Мини-приложение микроблог
с пользователями и их сообщениями.

## Зависимости

- Ruby 4.0.7 (macOS, Homebrew)
- Bundler 4.0.20
- Rails 8.1.3.1

Rails и остальные гемы ставятся из `Gemfile`.

## Установка Ruby и Rails (macOS)

```bash
brew install ruby
```

Homebrew-Ruby нужно поставить в `PATH` раньше системного (строка добавляется
в `~/.zshrc`, после неё откройте новое окно терминала):

```bash
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"
```

```bash
gem install rails --no-document
ruby -v     # ruby 4.0.7
rails -v    # Rails 8.1.3.1
```

## Запуск

```bash
bin/setup --skip-server
bin/rails db:seed
bin/dev
```

`bin/setup` ставит гемы и создаёт базу, `db:seed` наполняет её данными для
демонстрации, `bin/dev` поднимает сервер. Приложение открывается на
[localhost:3000](http://localhost:3000).

## Данные для демонстрации

```bash
bin/rails db:seed
```

Скрипт [db/seeds.rb](db/seeds.rb) добавляет двух пользователей и два
микросообщения у первого из них. Повторный запуск дубликатов не создаёт.

Очистить базу и залить данные заново (сервер перед этим лучше остановить):

```bash
bin/rails db:schema:load
bin/rails db:seed
```

`db:schema:load` пересоздаёт таблицы по `db/schema.rb`, нумерация записей
начинается с единицы.

## Маршруты

| Адрес | Что там |
| --- | --- |
| `/` | список пользователей, это же корневой маршрут |
| `/users` | то же самое |
| `/users/new` | форма создания пользователя |
| `/users/{id}` | страница одного пользователя |
| `/users/{id}/edit` | форма редактирования |
| `/microposts` | список микросообщений |
| `/microposts/new` | форма создания микросообщения |
| `/microposts/{id}` | одно микросообщение |
| `/microposts/{id}/edit` | форма редактирования |

## Модели

- `User` (`name`, `email`) — имя и email обязательны; `has_many :microposts`.
- `Micropost` (`content`, `user_id`) — текст обязателен и не длиннее
  140 символов; `belongs_to :user`.

**Связь пользователей и микросообщений.** В консоли:

```bash
bin/rails console
```

```ruby
User.first.microposts   # два микросообщения первого пользователя
Micropost.first.user    # обратно: владелец микросообщения
```

**Тесты.**

```bash
bin/rails test
```
