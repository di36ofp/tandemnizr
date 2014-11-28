class Tandem < ActiveRecord::Base

  belongs_to :user
  #has_and_belongs_to_many :users, :through => :current_user_id
end
