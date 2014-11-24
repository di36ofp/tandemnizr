class User < ActiveRecord::Base

  before_save :encrypt_password

  alpha_num_regex = /\A[\w\s*]+\Z/
  email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  strong_password_regex = /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/

  validates :name, uniqueness:  true,
                   length:      { maximum: 30 },
                   format:      { with: alpha_num_regex }
  validates :email, presence:   true,
                   uniqueness:  true,
                   format:      { with: email_regex }
  validates :password, presence: true,
                      :confirmation => true,
                      format: { with: strong_password_regex }
  #validates :nationality
  #validates :city
  validates :cp, :inclusion => 00000..99999
  validates :age, :inclusion => 18..99
  #validates :career
  #validates :photo
  #validates :description

  private
  def encrypt_password
    self.password = encrypt(password)
  end
end
