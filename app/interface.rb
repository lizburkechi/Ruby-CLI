class Interface

    attr_reader :prompt
    attr_accessor :user, :username

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "🐾 Welcome to You Let the Dogs Out🐾"
        sleep(2)
        prompt.select("What would you like to do today?") do |menu|
            menu.choice "Login", -> { login_helper }
            menu.choice "Sign Up", -> { signup_helper }
            menu.choice "Exit", -> { exit_helper }
        end
    end

    def login_helper
       username = prompt.ask("Please enter your username:")
       response = User.find_by(username: username)
       if response
           main_page
       else
           puts "Sorry, but I can't find an account that matches this username. Please try again.."
           sleep(2)
           self.welcome
       end 
    end

    def signup_helper
        username = prompt.ask("Please enter a unique username:")
        while User.find_by(username: username)
            puts "Sorry, this username is already taken."
            username = prompt.ask("Please enter a unique username:")
        end
        dog_name = prompt.ask("What is your dog's name?")
        dog_age = prompt.ask("What is your dog's age?").to_i
        breed = prompt.ask("What is your dog's breed?")
        likes_walks = prompt.yes?("Does your dog usually enjoy walks?")
        self.user = User.create(username: username, dog_name: dog_name, dog_age: dog_age, breed: breed, likes_walks: likes_walks)
        main_page
    end

    def main_page
        sleep(0.5)
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Schedule a walk appointment.", -> {appointment_helper}
            menu.choice "See your dog's walk appointments.", -> {my_appointments}
            menu.choice "Edit your dog's walk appointments.", -> {edit_appointments}
            menu.choice "Cancel a walk appointment.", -> {cancel_appointments}
            menu.choice "Exit"
        end
    end

    def appointment_helper
        system 'clear'
        choices = %w(Rhydon Nidoran Venonat Metapod Bellsprout Starmie Kadabra Eevee Dodrio Zubat)
        prompt.enum_select("Choose your walker:", choices)
        system 'clear'
        times = %w(9:00 10:00 11:00 12:00 1:00 2:00 3:00 4:00 5:00 6:00)
        prompt.enum_select("Choose the hour for your walk:", times)

    end

    def my_appointments
        
    
    end

    def edit_appointments
        puts "edit appts"
    end

    def cancel_appointments
        puts "cancel"
    end

    def exit_helper
       puts "Goodbye"
    end

end