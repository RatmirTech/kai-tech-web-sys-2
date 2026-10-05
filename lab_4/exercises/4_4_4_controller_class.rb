# Упражнения раздела 4.4.4: класс контроллера.
#
# Скрипту нужно окружение Rails, поэтому запускается через runner:
#
#   bin/rails runner exercises/4_4_4_controller_class.rb
#
# Упражнения книги предлагают консоль учебного приложения из главы 2
# (там есть модель User), поэтому второй блок выполняется в lab_2:
#
#   cd ../lab_2 && bin/rails runner ../lab_4/exercises/4_4_4_controller_class.rb

def hierarchy(klass)
  chain = [klass]
  chain << chain.last.superclass while chain.last.superclass
  chain.join(" < ")
end

if defined?(StaticPagesController)
  # Листинг из текста: контроллер создаётся как обычный объект.
  controller = StaticPagesController.new
  puts controller.class
  puts hierarchy(controller.class)
  p controller.home   # действие home пустое, поэтому nil
end

if defined?(User)
  # 1. Создание объекта пользователя через User.new.
  user = User.new
  p user.class

  # 2. Иерархия классов объекта пользователя.
  puts hierarchy(user.class)
end
