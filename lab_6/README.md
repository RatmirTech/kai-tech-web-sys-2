# Ruby on Rails Tutorial sample application

Лабораторная работа №6: модель пользователя.

Это учебное приложение для книги
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://www.railstutorial.org/)
Майкла Хартла ([Michael Hartl](https://www.michaelhartl.com/)), глава 6.
Работа продолжает приложение из лабораторной №5.

## Зависимости

- Ruby 4.0.7
- Rails 8.1.3.1
- SQLite (база `storage/development.sqlite3`, в git не попадает)

## Как начать

```bash
bundle install
bin/rails db:migrate
bin/rails test
bin/rails server
```

## Что сделано

Модель [User](app/models/user.rb) с атрибутами `name`, `email` и безопасным
паролем.

| Миграция | Что делает |
| --- | --- |
| `create_users` | таблица `users`: `name`, `email`, `created_at`, `updated_at` |
| `add_index_to_users_email` | уникальный индекс по `email` (уникальность на уровне базы) |
| `add_password_digest_to_users` | столбец `password_digest` для хеша bcrypt |

Валидации и колбэки:

| Правило | Где |
| --- | --- |
| имя обязательно, не длиннее 50 символов | `validates :name` |
| email обязателен, не длиннее 255, соответствует `VALID_EMAIL_REGEX`, уникален | `validates :email` |
| email приводится к нижнему регистру перед сохранением | `before_save` |
| пароль и подтверждение, хеш bcrypt, метод `authenticate` | `has_secure_password` |
| пароль обязателен (не из пробелов), не короче 6 символов | `validates :password` |

Каждое правило сделано по циклу Red-Green: сначала тест в
[test/models/user_test.rb](test/models/user_test.rb), потом код модели.

## Тесты

```bash
bin/rails test
```

Только тесты моделей:

```bash
bin/rails test:models
```

## Упражнения по консоли

В книге упражнения главы 6 выполняются в `rails console`. Здесь каждое оформлено
скриптом в папке [exercises](exercises); запуск из папки `lab_6`:

```bash
bin/rails runner exercises/6_1_3_creating_users.rb
```

| Скрипт | Раздел | Тема |
| --- | --- | --- |
| `6_1_2_model_file.rb` | 6.1.2 | иерархия `User < ApplicationRecord < ActiveRecord::Base` |
| `6_1_3_creating_users.rb` | 6.1.3 | `new`, `valid?`, `save`, `create`, `destroy` |
| `6_1_4_finding_users.rb` | 6.1.4 | `find`, `find_by`, `first`, `all` |
| `6_1_5_updating_users.rb` | 6.1.5 | `save`, `reload`, `update`, `update_attribute` |
| `6_2_validations.rb` | 6.2 | ошибки валидации, регулярное выражение для email |
| `6_3_secure_password.rb` | 6.3.2, 6.3.3 | требования к паролю |
| `6_3_4_create_authenticate.rb` | 6.3.4 | создание пользователя и `authenticate` |

Скрипты работают как `rails console --sandbox`: изменения базы откатываются.
Исключение - `6_3_4_create_authenticate.rb`, он сохраняет пользователя в базе
development, как в книге, и его можно запускать повторно.

## Отличия от учебника

- **Версии.** Книга написана для Rails 7.0.4 и Ruby 3.1.2, здесь Rails 8.1.3.1 и
  Ruby 4.0.7: миграции получают `ActiveRecord::Migration[8.1]`, а `bcrypt`
  подтянулся версии 3.1.22 (`gem "bcrypt", "~> 3.1.7"`).
- **Регулярное выражение.** Оставлен усиленный вариант из листинга 6.23
  (запрещает `foo@bar..com`), он получен в упражнении 6.2.4.
- **Колбэк.** Оставлен вариант `self.email = email.downcase` (листинг 6.32);
  вариант с `email.downcase!` (листинг 6.35) проверен и откачен.
- **Rubular** из браузера не использовался: регулярное выражение проверено
  на тех же адресах скриптом `6_2_validations.rb`.
- **Фикстуры** `test/fixtures/users.yml` очищены (листинг 6.31): иначе уникальный
  индекс не позволяет загрузить две записи с одинаковым email.
- **Двойное сообщение** `Password can't be blank` - не ошибка: presence-проверку
  добавляют и `has_secure_password`, и `validates :password` (листинг 6.43).
- DB Browser for SQLite, GitHub, облачная IDE и Heroku не используются,
  ветки не создаются.
