class User < ActiveRecord::Base

  validates :name, presence:    true,
                   uniqueness:  true,
                   length:      { maximum: 30 },
                   format:      { with: /\A[\w\s*]+\Z/ }
  validates :email, presence:   true,
                   uniqueness:  true,
                   format:      { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  validates :password, presence: true,
                   format:      { with: /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/ }
  validates :nationality, presence: true
  validates :city, presence: true
  validates :cp, presence: true,
                  :inclusion => 00000..99999
  validates :age, presence: true,
                  :inclusion => 18..99
  validates :career, presence: true
  validates :photo, presence: true
  validates :description, presence: true
end
