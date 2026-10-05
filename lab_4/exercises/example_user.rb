class User
  attr_accessor :first_name, :last_name, :email

  def initialize(attributes = {})
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @email = attributes[:email]
  end

  # 1. Имя и фамилия через пробел.
  def full_name
    "#{@first_name} #{@last_name}"
  end

  # 2. Фамилия и имя через запятую с пробелом.
  def alphabetical_name
    "#{@last_name}, #{@first_name}"
  end

  def formatted_email
    "#{full_name} <#{@email}>"
  end
end
