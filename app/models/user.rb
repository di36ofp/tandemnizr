class User < ActiveRecord::Base

  #attr_accessor :password, :password_confirmation

  before_save(on: :create) do
    :is_equal? if attribute_present?("password")
  end

  before_save :encrypt_password

  validates :name, allow_blank:  true,
                   uniqueness:  true,
                   length:      { maximum: 30 },
                   format:      { with: /\A[\w\s*]+\Z/ }
  validates :email, presence:   true,
                    uniqueness:  true,
                    format:      { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ ,
                                  message: 'The format of email is invalid'}
  validates :password, confirmation: true,
                       on: :create,
                       presence: true,
                       format: { with: /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/ ,
                                message: 'Must contain at least 8 chars, a majuscule, minuscule, number and special sign'}
  #validates :nationality
  #validates :city
  validates :cp, allow_blank:  true,
                :inclusion => 00000..99999
  validates :age, allow_blank:  true,
                :inclusion => 18..99
  #validates :career
  #validates :photo
  #validates :description

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def has_password?(submitted_password)
    password == encrypt(submitted_password)
  end

  private

  def is_equal?
      password == password_confirmation
  end

  def should_validate?
    new_record? || email.present?
  end

  def encrypt_password
    self.password = secure_hash(password)
  end

  def encrypt(string)
    secure_hash(string)
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
