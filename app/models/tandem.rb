class Tandem < ActiveRecord::Base
  has_many :users, through: :participation
  has_many :participations
end
