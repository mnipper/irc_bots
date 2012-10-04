irc_bots
========

irc_bots
=======
Description
-----------

This is a IRC bot with various bot plug-ins.

There are currently these plugins:

### Ascii bot
Scroll ascii art

### Cowsay bot
Make a cow say something

### Google bot
Return a link to the first google result for a query

### Help bot
Scroll a list of commands

### Opbot
Op a paticular user when the command is given

### Roulette Bot
A user has a 1 in 6 chance of being kicked from the room.  If the user successfully executes this command 12 times in a row without being kicked, the user is given op status.

### Slap bot
Allow users to slap other users.  Everytime a user is slapped, 10 hp is taken away.  Once the user reaches 0 hp, he or she is kicked from the room.  Users may also heal other users in increments of 10.  A user may check his or her hp with the hp command.

### Tiny URL bot
Respond with a tiny url for a long url sent to the room.

### Urban bot
Return the first defintion of a word or phrase from Urban Dictionary.

Installation
------------
The following are required for running irc_bots (Ubuntu/Debian):

```
sudo apt-get install ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8
sudo apt-get install libreadline-ruby1.8 libruby1.8 libopenssl-ruby
sudo apt-get install libxslt-dev libxm12-dev
gem install nokogiri
gem install cinch
```

You also are required to provide the necessary credentials to access the server in a creds.rb file in the project root directory.  The creds.rb should have the following format:

```
class Creds 
  def self.server 
    "irc server location" 
  end 

  def self.nick 
     "bot_nick" 
  end 

  def self.password 
    "password" 
  end 

  def self.channels 
    ["#channel1", "#channel2"] 
  end 
end
```
