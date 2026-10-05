# Упражнения раздела 6.1.2: файл модели.
#
#   bin/rails runner exercises/6_1_2_model_file.rb

require_relative "sandbox"

def hierarchy(klass)
  chain = [klass]
  chain << chain.last.superclass while chain.last.superclass
  chain.join(" < ")
end

# 1. User.new принадлежит классу User, который наследуется от ApplicationRecord.
show "User.new.class", User.new.class
show "User.superclass", User.superclass
puts hierarchy(User)

# 2. ApplicationRecord наследуется от ActiveRecord::Base.
show "ApplicationRecord.superclass", ApplicationRecord.superclass
