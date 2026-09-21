# Ruby on Rails Tutorial sample application

Лабораторная работа №3: почти статические страницы.

Это учебное приложение для книги
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://www.railstutorial.org/)
Майкла Хартла ([Michael Hartl](https://www.michaelhartl.com/)), глава 3.

## Лицензия

Весь исходный код [Ruby on Rails Tutorial](https://www.railstutorial.org/)
доступен совместно по лицензиям MIT и Beerware. Подробности в
[LICENSE.md](https://github.com/learnenough/rails_tutorial_sample_app_7th_ed/blob/main/LICENSE.md).

## Зависимости

- Ruby 4.0.7
- Rails 8.1.3.1

## Как начать

Установить нужные гемы:

```bash
bundle install
```

Выполнить миграции базы данных:

```bash
bin/rails db:migrate
```

Запустить набор тестов и убедиться, что всё работает:

```bash
bin/rails test
```

Если тесты проходят, приложение можно запускать на локальном сервере:

```bash
bin/rails server
```

## Страницы

Базовый заголовок у всех страниц: `Ruby on Rails Tutorial Sample App`.

| Страница | Адрес | Заголовок (`title`) |
| --- | --- | --- |
| Home | `/` и `/static_pages/home` | Home \| Ruby on Rails Tutorial Sample App |
| Help | `/static_pages/help` | Help \| Ruby on Rails Tutorial Sample App |
| About | `/static_pages/about` | About \| Ruby on Rails Tutorial Sample App |
| Contact | `/static_pages/contact` | Contact \| Ruby on Rails Tutorial Sample App |

Общий каркас страниц лежит в `app/views/layouts/application.html.erb`,
а заголовок каждая страница задаёт через `provide(:title, "...")`.

## Тесты

```bash
bin/rails test
```

Тесты контроллера лежат в `test/controllers/static_pages_controller_test.rb`:
проверяются корневой маршрут, статус ответа и заголовок каждой страницы.

Автоматический запуск тестов при изменении файлов (Guard). На приглашении
`guard>` клавиша Enter запускает все тесты, `Ctrl-D` завершает работу:

```bash
bundle exec guard
```

## Отличия от учебника

Учебник написан для Rails 7.0.4 и Ruby 3.1.2, здесь используются Rails 8.1.3.1
и Ruby 4.0.7:

- вместо `sprockets-rails` и `sassc-rails` работает Propshaft, поэтому в layout
  подключается `stylesheet_link_tag :app`;
- JavaScript (importmap, Turbo, Stimulus) не устанавливается: книга сама
  советует отложить его до раздела 8.2.4;
- облачная IDE, GitHub и Heroku не используются, поэтому нет гема `pg` и
  настройки `config.hosts.clear`;
- гем `webdrivers` не нужен, Selenium сам управляет драйвером;
- в `Gemfile` закреплён `json` ниже 3.0, иначе Rails 8.1.3.x отвечает
  ошибкой 500 при работе с сессией;
- в тестовом окружении Rails 8 ошибки маршрутизации и отсутствующего шаблона
  превращаются в ответы 404 и 406, поэтому красный тест выглядит как
  `Expected response to be a <2XX: success>`, а не как исключение.

Подробнее в
[книге *Ruby on Rails Tutorial*](https://www.railstutorial.org/book).
