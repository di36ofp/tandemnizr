class User < ActiveRecord::Base

  before_save(on: :create) do
    :is_equal? if attribute_present?("password")
  end

  before_save :encrypt_password

  has_many :languages

  self.per_page = 10

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

  def self.find_by_languages(current_user)
    # Usuarios disponibles para tandem y compartan conmigo
    # al menos un idioma en comun
    User.where(id: Language.where(language: current_user.languages.pluck(:language)).pluck(:user_id))
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
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
    self.salt = make_salt
    if new_record?
      self.password = encrypt(password)
    end
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
