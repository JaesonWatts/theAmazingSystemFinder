class Results_3

  def self.clear_systems
    Systems.clear_all
    puts "Systems Cleared!"
    Cli.wait_for_enter
  end
  
end