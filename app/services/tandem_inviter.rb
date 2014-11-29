class TandemInviter
  # Public: Initializes a TandemInviter given a Tandem.
  #
  # tandem - The Tandem to be used.
  def initialize(tandem)
    @tandem = tandem
  end

  # Public: Invites a user to this Tandem. Will send an invitation mail.
  #
  # user - The user to be invited.
  #
  # Returns nothing.
  def invite(user)
    participation = @tandem.participations.create(
      user:user,
      token: generate_token
    )

    send_invitation_mail participation
    true
  end

  # Public: Accepts an invitation from a user and sets his desired learning
  # language.
  #
  # user              - The user accepting the invitation.
  # token             - The secret token of his invitation.
  # language_to_learn - The language the user is willing to learn.
  #
  # Returns true if the invitation got accepted, false otherwise.
  def accept_invitation(user, token, language_to_learn)
    participation = @tandem.participations.where(user: user, token: token).first
    return false unless participation

    participation.update_attributes(
      confirmed: true,
      token: nil,
      language: language
    )
    true
  end

  private

  def send_invitation_mail(participation)
    # Pending implementation
  end

  def generate_token
    SecureRandom.urlsafe_base64(nil, false)
  end
end
