class AssignPhoneService
  def self.call(params)
    new(params[:user_email], params[:phone]).call
  end

  def initialize(user_email, phone = nil)
    @user_email = user_email
    @phone = phone
  end

  def call
    return 'Enter your email' unless user_email
    phone = check_phone
    return Phone.create(user_email: user_email, phone: convert_phone) if phone.present?
    Phone.create(user_email: user_email, phone: generate_phone)
  end

  private

  attr_reader :user_email, :phone

  def check_phone
    return phone if phone.present? && validate_phone(convert_phone)
  end

  def convert_phone
    phone.split('-').join('_').to_i
  end


  def generate_phone
    number = Phone::MIN_VALUE
    until validate_phone(number)
      number += 1
    end

    number
  end

  def validate_phone(phone)
    Phone.new(user_email: user_email, phone: phone).valid?
  end
end
