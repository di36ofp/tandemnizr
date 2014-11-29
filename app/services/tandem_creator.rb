class TandemCreator
  # Public: Initializes a tandem creator.
  #
  # language_to_learn - The language that the creator is wanting to learn.
  # creator           - A User instance of the user creating the tandem.
  # invited           - The user the creator's inviting.
  #
  def initialize(language_to_learn, creator, invited)
    @language_to_learn = language_to_learn
    @creator = creator
    @invited = invited
  end

  # Public: Creates a tandem, adds the creator as an already confirmed user,
  # and invites the other user.
  #
  # Returns the newly created Tandem.
  def create
    return @tandem if @tandem

    @tandem = Tandem.create
    @tandem.participations.create(
      user: @creator,
      confirmed: true,
      language: @language_to_learn
    )

    TandemInviter.new(@tandem).invite(@invited)
    @tandem
  end
end