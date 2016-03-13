class GameMailer < ActionMailer::Base
  default to: 'andrea.rocca3@gmail.com'
  
  def game_email(name, address, time, email, date)
    @name = name
    @date = date 
    @address = address
    @time = time
    mail(to: email, from: "a.rocca@criteo.com", subject: '[WEEKLY FOOTBALL] - Game Subscription')
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
  
  def optout_user_email (name, email)
    @name = name
    
    mail(to: email, from: "a.rocca@criteo.com", subject: "Criteo Football - Opt-out Confirmation")
  end 
end
