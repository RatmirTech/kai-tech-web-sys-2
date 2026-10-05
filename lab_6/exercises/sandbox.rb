# Общие помощники для упражнений главы 6.
#
# Скрипты запускаются из папки lab_6 через rails runner:
#
#   bin/rails runner exercises/6_1_3_creating_users.rb

# Имитация `rails console --sandbox`: все изменения базы откатываются.
def sandbox
  ActiveRecord::Base.transaction do
    yield
    raise ActiveRecord::Rollback
  end
end

# Атрибуты пользователя. После раздела 6.3 модели нужен пароль, поэтому
# он добавляется автоматически, как только появляется has_secure_password.
# Так скрипты работают на любом этапе главы.
def user_attrs(attrs)
  return attrs unless User.method_defined?(:password=)

  attrs.merge(password: "foobar", password_confirmation: "foobar")
end

# Печатает выражение вместе с его значением, как консоль: >> выражение => значение
def show(label, value)
  puts "#{label.ljust(46)} => #{value.inspect}"
end
