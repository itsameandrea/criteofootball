namespace :weekly_games do
  desc "Create new game every Monday and sends the invite"
  task create_game: :environment do
    
    day = Time.now.day + 2
    emails = []
    @game = Game.new
    @game.name = "Wednesday #{day} March"
    @game.address = "Club Natacio Barceloneta"
    @game.time = "18:30"
    
    User.each do |u|
      
      emails.push(u.email)
      
    end
    
    if @game.save 
      GameMailer.weekly_game_email(@game.name, @game.address, @game.time, emails)
    end
    
  end

end
