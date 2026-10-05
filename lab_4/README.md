# Ruby on Rails Tutorial sample application

Лабораторная работа №4: Rails-flavored Ruby.

Это учебное приложение для книги
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://www.railstutorial.org/)
Майкла Хартла ([Michael Hartl](https://www.michaelhartl.com/)), глава 4.
Работа продолжает приложение из лабораторной №3.

## Лицензия

Весь исходный код [Ruby on Rails Tutorial](https://www.railstutorial.org/)
доступен совместно по лицензиям MIT и Beerware. Подробности в
[LICENSE.md](https://github.com/learnenough/rails_tutorial_sample_app_7th_ed/blob/main/LICENSE.md).

## Зависимости

- Ruby 4.0.7
- Rails 8.1.3.1

## Как начать

Установить гемы, выполнить миграции, запустить тесты и сервер:

```bash
bundle install
bin/rails db:migrate
bin/rails test
bin/rails server
```

## Что изменилось в приложении

Хелпер `full_title` в [app/helpers/application_helper.rb](app/helpers/application_helper.rb)
возвращает базовый заголовок `Ruby on Rails Tutorial Sample App`, а если у страницы
есть свой заголовок, то `<заголовок> | Ruby on Rails Tutorial Sample App`.
Layout берёт заголовок из хелпера: `<title><%= full_title(yield(:title)) %></title>`.

Поэтому главной странице собственный заголовок больше не нужен: из
`static_pages/home.html.erb` убран `provide(:title, "Home")`, и у `/` теперь
базовый заголовок. Тест главной страницы обновлён по циклу Red-Green.

| Страница | Адрес | Заголовок |
| --- | --- | --- |
| Home | `/`, `/static_pages/home` | Ruby on Rails Tutorial Sample App |
| Help | `/static_pages/help` | Help \| Ruby on Rails Tutorial Sample App |
| About | `/static_pages/about` | About \| Ruby on Rails Tutorial Sample App |
| Contact | `/static_pages/contact` | Contact \| Ruby on Rails Tutorial Sample App |

## Упражнения по Ruby

В книге упражнения разделов 4.2-4.4 выполняются в консоли `rails console`.
Здесь каждое оформлено скриптом в папке [exercises](exercises), чтобы результат
можно было воспроизвести. Запуск, из папки `lab_4`:

```bash
ruby exercises/4_2_1_strings.rb
```

| Скрипт | Раздел книги | Тема |
| --- | --- | --- |
| `4_2_1_strings.rb` | 4.2.1 | строки, интерполяция, одинарные и двойные кавычки |
| `4_2_2_objects.rb` | 4.2.2 | объекты, `reverse`, `==`, тест палиндрома |
| `4_2_3_methods.rb` | 4.2.3 | определение методов, `palindrome_tester` |
| `4_3_1_arrays.rb` | 4.3.1 | массивы и диапазоны, `split`, `join` |
| `4_3_2_blocks.rb` | 4.3.2 | блоки, `map`, `yeller`, перемешивание |
| `4_3_3_hashes.rb` | 4.3.3 | хеши, символы, вложенные хеши, `merge` |
| `4_4_1_constructors.rb` | 4.4.1 | литеральные и именованные конструкторы |
| `4_4_2_inheritance.rb` | 4.4.2 | иерархия классов, класс `Word` |
| `4_4_3_modifying_builtin.rb` | 4.4.3 | методы `palindrome?` и `shuffle` в `String` |
| `4_4_4_controller_class.rb` | 4.4.4 | иерархия контроллера и модели (нужен `rails runner`) |
| `4_4_5_user_class.rb` | 4.4.5 | класс `User` из `example_user.rb` |

Скрипту `4_4_4_controller_class.rb` нужно окружение Rails:

```bash
bin/rails runner exercises/4_4_4_controller_class.rb
```

Упражнение про `User.new` в книге относится к учебному приложению главы 2,
поэтому для него скрипт запускается в `lab_2`:

```bash
cd ../lab_2 && bin/rails runner ../lab_4/exercises/4_4_4_controller_class.rb
```

## Отличия от учебника

- В разделе 4.5 книга предлагает удалить `example_user.rb` из корня приложения.
  Он перенесён в `exercises/` и оставлен, чтобы результат упражнений 4.4.5
  был виден в репозитории. На работу приложения он не влияет: папка
  `exercises` не подключается Rails.
- В листинге 4.3 после `full_title(yield(:title))` стоит лишний пробел внутри
  `<title>`, он не воспроизведён: тест ожидает точное совпадение заголовка.
- Книга написана для Rails 7.0.4 и Ruby 3.1.2, здесь используются Rails 8.1.3.1
  и Ruby 4.0.7; подробности стека описаны в README лабораторной №3.
- GitHub, облачная IDE и Heroku не используются, ветки не создаются.
