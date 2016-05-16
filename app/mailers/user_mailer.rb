class UserMailer < ApplicationMailer
  default from: 'notifications@note-ilus.fr'
 
  def invitation_email(user)
    @user = user
    @url  = 'localhost:3000'
    mail(to: @user.email, subject: 'Vos notes en direct')
  end
end
