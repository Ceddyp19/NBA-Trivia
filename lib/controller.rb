
class Controller
  ######################################### Method that runs all other methods ###############################
 def self.run
   intro 
   profile 
 end

 ############################################ ALL OF THE METHODS ###########################################


    def self.main_menu 
     if @@current_user == nil
            puts "You have to be logged in to play NBA TRIVIA!!! :("
            login
     else
        puts"\n" * 30 
        intro
        puts "Hello #{@@current_user.name.light_blue.bold}!"
        puts "\n" 
        menu_selection = PROMPT.select("Select an option:", ["Start Round", "Stats", "Help", "Logout", "Quit Game"])
        case menu_selection
          when 'Start Round' 
            new_round
          when 'Stats'      
            stats
          when 'Help'       
            help 
          when 'Logout'    
            @@current_user = nil
            main_menu
          when 'Quit Game'
            quit 
         end
         puts "\n" * 3 
      end
    end

    def self.signup
      sign_up = PROMPT.select("\n\n\n", ["Signup", "Back"])
        
        if sign_up == "Signup"
          puts "Please enter a username:"
          puts "\n" * 3 
          name = gets.chomp
            @@current_user = User.create(name: name)
            main_menu
        else sign_up == "Back"
            new_user
        end

    end

    def self.login
       login_or_exit = PROMPT.select("", ["Login", "Back"])
       if login_or_exit == "Login"
          puts "\n" * 5
          find_user = PROMPT.ask("What is your username?".light_cyan, required: true)
          @@current_user = User.find_by(name: find_user)
            if @@current_user == nil
              puts "User not found".light_red
              puts "Please try again!"
              self.login
            else
            main_menu
            end
        elsif login_or_exit == 'Back'
          puts"\n" * 50 
              intro
              profile
        end
    end

    def self.profile
        prompt = PROMPT 
        y_or_n = prompt.yes?('Do you have a profile?')

        if y_or_n == true
          login 
        elsif y_or_n == false
          new_user
        end
    end

    def self.instructions
        puts "*".light_cyan * 100 
        puts "*".red * 100
        puts "WELCOME TO NBA TRIVIA!!!".blue.underline
        puts "The game is simple:".white 
        puts "\n" 
        puts "We give you some info about a specific NBA game and you tell us who you think won that game?".green
        puts "If you guess correctly, you're rewarded points based on the difficulty of the question.".green
        puts "\n"
        puts "Point System:".light_blue.underline
        puts "Close games are 3 pointers".white
        puts "Average games are 2 pointers".white
        puts "Blowouts (one-sided games) are free-throws (1 pointers)".white
        puts "\n"
        puts "The more you guess correctly, the more your point stats grow!".green 
        puts "Easy enough, right? Let's Begin!!!".green
        puts "*".red * 100
        puts "*".light_cyan * 100
    end

    def self.help 
      puts"\n" * 50 
      instructions
      prompt = PROMPT
      option = prompt.select("\n\n", ["Start Round", "Main Menu" ])
      case option
      when 'Start Round'
        new_round
      when 'Main Menu'
        main_menu
      end
    end
 
    def self.new_user
      puts "\n" * 35
      puts "/".white * 100
      instructions
      puts "/".white * 100
      puts "\n" * 3 
      prompt = PROMPT
        login = prompt.select("Select an Option", ["Create Username", "Back", "Quit Game"])
      if login == 'Create Username'
        signup
      elsif login == 'Back'
        puts"\n" * 50
        intro
        profile
        puts"\n" * 25 
      elsif login == 'Quit Game'
        quit 
      end
    end

    def self.intro
          
          puts"                                                                                                                                                                                                                                                                      
                                                                                                                                
                                                                                                                                                                                                                                                                      
          _ _ _     _                      _                                                                                     
          | | | |___| |___ ___ _____ ___   | |_ ___                                                                             
          | | | | -_| |  _| . |     | -_|  |  _| . |_ _ _                                                                         
          |_____|___|_|___|___|_|_|_|___|  |_| |___|_|_|_|   ".colorize(:magenta)                                                                                                                                                                                                  
   puts"          ================================================".colorize(:light_cyan)                                                                                                                                          
                puts "
                ███╗   ██╗██████╗  █████╗     ████████╗██████╗ ██╗██╗   ██╗██╗ █████╗     ██╗██╗██╗
                ████╗  ██║██╔══██╗██╔══██╗    ╚══██╔══╝██╔══██╗██║██║   ██║██║██╔══██╗    ██║██║██║
                ██╔██╗ ██║██████╔╝███████║       ██║   ██████╔╝██║██║   ██║██║███████║    ██║██║██║
                ██║╚██╗██║██╔══██╗██╔══██║       ██║   ██╔══██╗██║╚██╗ ██╔╝██║██╔══██║    ╚═╝╚═╝╚═╝
                ██║ ╚████║██████╔╝██║  ██║       ██║   ██║  ██║██║ ╚████╔╝ ██║██║  ██║    ██╗██╗██╗
                ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝       ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝  ╚═╝    ╚═╝╚═╝╚═╝
                                                                                                      ".colorize(:color => :green, :background => :light_grey)
                puts"\n" * 5                                                                                  
    end

    def self.quit
       puts "\n" * 50 
    
      puts "                                                  
                                   ██████╗  ██████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███████╗
                                  ██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝
                                  ██║  ███╗██║   ██║██║   ██║██║  ██║██████╔╝ ╚████╔╝ █████╗  
                                  ██║   ██║██║   ██║██║   ██║██║  ██║██╔══██╗  ╚██╔╝  ██╔══╝  
                                  ╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝██████╔╝   ██║   ███████╗
                                   ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝
                                                                  ".green.bold
                                  print"\s" * 55, "Play again soon!".blue
      # puts "\n" * 5            
    end 

    def self.stats 
            puts "\n" * 50 
            puts "        STATS       ".bold
            puts "---------------------".magenta
            puts "You have played #{@@current_user.round_count} round(s).".white 
            puts "Wins: ""#{@@current_user.win_count}".green
            puts "Losses: ""#{@@current_user.loss_count}".red
            puts "Points: ""#{@@current_user.points}".blue
            puts "--------------------".magenta  
            puts "\n"
            prompt = PROMPT
            option = prompt.select("", ["Start Round", "Main Menu", "Quit Game"])
            case option
            when 'Start Round'
              new_round
            when 'Main Menu'
              main_menu
            when 'Quit Game'
              quit
            end
    end

    def self.new_round
      new_game = Game.create_game
      puts "\n" * 35  
      puts "----------------------".magenta * 4
      puts "\n" * 2
      print "The year was ".white 
      print"#{new_game.year}".blue #1990 is the api_year_value
      puts "\n" * 2
      print "The home team was the".white 
      print " #{new_game.home_team}".green
      print ", and the away team was the".white
      print " #{new_game.visitor_team}".red #api_home_team and #api_away_team
      puts "\n" * 2
      print "The final score was".white
      print " #{new_game.score}".light_blue #api_home_team_points and api_away_team_points
      puts "\n" * 2
      print "The top scorers for the".white 
      print " #{new_game.home_team} were:".white  
      print " #{new_game.home_team_top_scorers}". yellow
      puts "\n" * 2
      print "The top scorers for the".white  
      print " #{new_game.visitor_team} were:" 
      print " #{new_game.visitor_team_top_scorers}". yellow 
      puts"\n" * 2 
      print "Point value:".white 
      print " #{new_game.point_value}".blue 
      print " pointer".white 
      puts"\n" * 2 
      puts "Who do you think won?".white 
      puts "\n" * 2 
      puts "----------------------".magenta * 4
      puts "\n" * 2 
      puts "------------------------".light_cyan
      puts "Select your answer below."
      puts "------------------------".light_cyan
      puts "\n" * 2
      winner = new_game.winner #winner is Warriors if api_home_team_points > api_away_team_points
      loser = new_game.loser
      prompt = PROMPT
      choice = prompt.select("", ["#{new_game.home_team}", "#{new_game.visitor_team}"])
      case choice
        when winner
          puts "\n" * 2
          puts "**********************".green 
          puts "You guessed correctly!".light_green
          puts "**********************".green
          puts "\n" * 2 
          puts "--------------------------".colorize(:magenta) * 2 
          puts " To quit game, return to Main Menu, or select Play Again."
          puts "--------------------------".colorize(:magenta) * 2
          new_game.save
          Round.create_round(@@current_user.id, new_game.id, true)
          prompt = PROMPT
          choice = prompt.select("", ["Play Again", "Main Menu"])
          case choice
          when 'Play Again'
            new_round
          when 'Main Menu'
            main_menu
          end
        when loser
          puts "\n" * 2 
          puts "**************************".red
          puts "Wrong!!! Do your homework!".light_red
          puts "**************************".red
          puts "\n" * 2
          puts "----------------------------".colorize(:magenta) * 2
          puts " Return to Main Menu to quit game or select Play Again.".white
          puts "----------------------------".colorize(:magenta) * 2
          new_game.save
          Round.create_round(@@current_user.id, new_game.id, false)
          prompt = PROMPT
          choice = prompt.select("",["Play Again", "Main Menu"])
            case choice
              when 'Play Again'
                new_round
              when 'Main Menu'
                main_menu
            end
       end
  
    end


  

end
