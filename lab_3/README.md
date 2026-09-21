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

Подробнее в
[книге *Ruby on Rails Tutorial*](https://www.railstutorial.org/book).
