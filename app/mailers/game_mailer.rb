class GameMailer < ActionMailer::Base
  default to: 'andrea.rocca3@gmail.com'
  
  def game_email(name, address, time, email)
    @name = name
    @address = address
    @time = time
    mail(to: email, from: "andrea.rocca3@gmail.com", subject: 'Criteo Game Subscription')
  end
end
