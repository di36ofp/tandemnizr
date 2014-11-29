class TandemCreator
  def tandem
    @tandem ||= Tandem.create
  end

  def invite user
    participation = tandem.participations.create user:user
    send_invitation_mail participation
  end

  def add user
    participations.create user:user
  end

  def set_language user, language
    participation = participations.where(user: user).first
    participation.language = language
    participation.save
  end

  private
  def send_invitation_mail participation
    puts "#{participation.id} part"
  end
  def participations
    tandem.participations
  end
end