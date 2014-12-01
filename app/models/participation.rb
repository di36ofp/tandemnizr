class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :tandem
  def self.find_participation_by_host
    User.find_by(id: :user_id)
  end
end
