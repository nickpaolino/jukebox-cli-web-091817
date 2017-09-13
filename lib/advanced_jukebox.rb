#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer
require "pry"
my_songs = {
"Go Go GO" => '/Users/nicholaspaolino/Desktop/Flatiron\ School/Labs/jukebox-cli-web-091817/audio/Emerald-Park/01.mp3',
"LiberTeens" => '/Users/nicholaspaolino/Desktop/Flatiron\ School/Labs/jukebox-cli-web-091817/audio/Emerald-Park/02.mp3',
"Hamburg" =>  '/Users/nicholaspaolino/Desktop/Flatiron\ School/Labs/jukebox-cli-web-091817/audio/Emerald-Park/03.mp3',
"Guiding Light" => '/Users/nicholaspaolino/Desktop/Flatiron\ School/Labs/jukebox-cli-web-091817/audio/Emerald-Park/04.mp3',
"Wolf" => '/Users/nicholaspaolino/Desktop/Flatiron\ School/Labs/jukebox-cli-web-091817/audio/Emerald-Park/05.mp3',
"Blue" => '/Users/nicholaspaolino/Desktop/Flatiron\ School/Labs/jukebox-cli-web-091817/audio/Emerald-Park/06.mp3',
"Graduation Failed" => '/Users/nicholaspaolino/Desktop/Flatiron\ School/Labs/jukebox-cli-web-091817/audio/Emerald-Park/07.mp3'
}

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  my_songs.keys.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name: "
  input = gets.chomp
  if my_songs.keys.include?(input) == true
    song = input
    location = my_songs[song]
    command = "open #{location}"
    system command
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  puts "Please enter a command:"
  input = gets.chomp
  while input != "exit"
    case input
    when "list"
      list(songs)
    when "play"
      play(songs)
    when "help"
      help
    else
      puts "Please enter a valid command."
    end
    input = gets.chomp
  end
  exit_jukebox
end
