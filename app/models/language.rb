class Language < ActiveRecord::Base

  belongs_to :user

  validate :user_exist

  private

  def user_exist
    unless User.find_by(id: user_id)
      errors.add(:user_id, 'does not exist')
    end
  end
end
