class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def meetup_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'I would like to join you')
  end
end
