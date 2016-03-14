class UserMailer < ActionMailer::Base
  default to: 'andrea.rocca3@gmail.com'

  def user_email(name, email, password)
      
      @name = name
      @password = password
      mail(to: email, from: "a.rocca@criteo.com", subject: "Criteo Football - Account Created")
      
  end

end
