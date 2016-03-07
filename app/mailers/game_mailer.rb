class GameMailer < ActionMailer::Base
  default to: 'andrea.rocca3@gmail.com'
  
  def game_email(name, address, time, email)
    @name = name
    @address = address
    @time = time
    mail(to: email, from: "a.rocca@criteo.com", subject: 'Criteo Game Subscription')
  end
  
  def weekly_game_email(date, address, time, emails)
    @date = date
    @address = address
    @time = time
    
    mail(to: emails, from: "a.rocca@criteo.com", subject: "[WEEKLY FOOTBALL] New Game Created")
  end
  
  def user_email(name, email, password)
      
      @name = name
      @password = password
      mail(to: email, from: "a.rocca@criteo.com", subject: "Criteo Football - Account Created")
      
  end
end
