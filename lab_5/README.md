# Ruby on Rails Tutorial sample application

Лабораторная работа №5: оформление layout.

Это учебное приложение для книги
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://www.railstutorial.org/)
Майкла Хартла ([Michael Hartl](https://www.michaelhartl.com/)), глава 5.
Работа продолжает приложение из лабораторной №4.

## Лицензия

Весь исходный код [Ruby on Rails Tutorial](https://www.railstutorial.org/)
доступен совместно по лицензиям MIT и Beerware. Подробности в
[LICENSE.md](https://github.com/learnenough/rails_tutorial_sample_app_7th_ed/blob/main/LICENSE.md).

## Зависимости

- Ruby 4.0.7
- Rails 8.1.3.1
- JavaScript-движок для ExecJS (нужен `autoprefixer-rails` при сборке стилей):
  на macOS подходит встроенный JavaScriptCore, Node.js не обязателен

## Как начать

```bash
bundle install
bin/rails db:migrate
bin/rails test
bin/rails server
```

## Что сделано

- **Bootstrap 3 и Sass.** Гемы `bootstrap-sass`, `sassc-rails`, `sprockets-rails`;
  стили лежат в [app/assets/stylesheets/custom.scss](app/assets/stylesheets/custom.scss)
  (вложенность и переменные Sass).
- **Layout.** [app/views/layouts/application.html.erb](app/views/layouts/application.html.erb)
  собран из partials: `_rails_default`, `_shim`, `_header`, `_footer`.
- **Главная страница.** Jumbotron, кнопка регистрации и логотип Rails
  (`app/assets/images/rails.svg`).
- **Именованные маршруты.** `root_path`, `help_path`, `about_path`,
  `contact_path`, `signup_path`; ссылки в шапке и футере используют их.
- **Контроллер Users** с действием `new` и заглушкой страницы `/signup`.
- **Тесты.** Контроллерные тесты, интеграционный тест ссылок layout и прямой тест
  хелпера `full_title`.

## Маршруты

| Страница | Адрес | Именованный маршрут | Заголовок |
| --- | --- | --- | --- |
| Home | `/` | `root_path` | Ruby on Rails Tutorial Sample App |
| Help | `/help` | `help_path` | Help \| Ruby on Rails Tutorial Sample App |
| About | `/about` | `about_path` | About \| Ruby on Rails Tutorial Sample App |
| Contact | `/contact` | `contact_path` | Contact \| Ruby on Rails Tutorial Sample App |
| Sign up | `/signup` | `signup_path` | Sign up \| Ruby on Rails Tutorial Sample App |

Ссылка Log in остаётся заглушкой `#`: маршрут появится в главе 8.

## Тесты

```bash
bin/rails test
```

Только интеграционные:

```bash
bin/rails test:integration
```

Автоматический запуск при изменении файлов (Guard):

```bash
bundle exec guard
```

## Отличия от учебника

- **Sprockets вместо Propshaft.** В лабораторных №3 и №4 приложение работало на
  Propshaft (стандарт Rails 8), но Bootstrap 3 и `bootstrap-sass` из книги
  требуют Sprockets и Sass-компилятор. Поэтому, как в листинге 5.5,
  подключены `sprockets-rails` и `sassc-rails`; добавлены
  `app/assets/config/manifest.js` и манифест `application.css` (листинг 5.19).
  Гем `sassc` собирается из исходников на Ruby 4.0.7 без проблем.
- **Bootstrap 3.4.1**, а не новее: так делает и книга, чтобы разметка
  (`navbar-fixed-top`, `jumbotron`, `btn-lg`) совпадала с описанной.
- **Страница Contact** уже была сделана в лабораторной №3, поэтому раздел 5.3.1
  не потребовал нового кода (тест из листинга 5.21 уже был).
- **Картинки** `rails.svg` и `kitten.jpg` скачаны с CDN книги
  (`cdn.learnenough.com`) в `app/assets/images`. Котёнок оставлен
  закомментированным на главной (`<%#= image_tag("kitten.jpg") %>`, листинг 5.10).
- **Упражнения-эксперименты** (скрыть все картинки через CSS, маршрут `helf`,
  подмена ссылки в футере, опечатка в базовом заголовке) выполнены и откачены,
  как предписывает книга; в историю они не попали.
- **Layout.** К листингу 5.1 оставлены три тега `<link rel="icon">` стандартного
  layout Rails 8, чтобы браузер не запрашивал несуществующий favicon.
- **Тест `should get root`** из лабораторной №3 удалён: в листинге 5.28 корень
  проверяет тест `should get home` через `root_path`.
- Книга написана для Rails 7.0.4 и Ruby 3.1.2, здесь Rails 8.1.3.1 и Ruby 4.0.7.
  GitHub, облачная IDE и Heroku не используются, ветки не создаются.
