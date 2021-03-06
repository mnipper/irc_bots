require 'cinch'
require './creds.rb'
require 'cinch/plugins/last_seen'
Dir["./bots/*.rb"].each { |file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    c.server = Creds.server
    c.password = Creds.password
    c.nick = Creds.nick
    c.channels = Creds.channels
    c.plugins.options[Cinch::Plugins::Timebomb] = {channels: Creds.channels }
    c.plugins.plugins = [GoogleBot, HelpBot, UrbanDictionary, SlapBot, CowsayBot, OpBot, AsciiBot, RouletteBot, SpiderMonitor, RageQuit, RedditBot, Cinch::Plugins::Timebomb, Cinch::Plugins::LastSeen]
  end

  ["hello", "hey", "hi", "howdy"].each do |greeting|
    on :message, greeting do |m|
      m.reply "Howdy, #{m.user.nick}!  Type !help for a list of bot commands."
    end
  end
end

bot.start
