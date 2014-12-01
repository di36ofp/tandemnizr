class UserMailer < ActionMailer::Base
  default from: "utopia19@gmail.com"

  def send_invitation participation
    @participation = participation
    mail(to: "info@diego-suarez.es", subject: "You've been invited to tandemnizr")
  end
end
