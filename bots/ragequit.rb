require 'cinch'

class RageQuit
  include Cinch::Plugin
    match /ragequit/

    def execute(m)
      Creds.channels.each do |channel|
        Channel(channel).send "** #{m.user.nick.upcase} RAGEQUIT **"
        Channel(channel).users.each do |user|
          unless user.first.nick == bot.nick
            Channel(channel).send "!slap #{user.first.nick}"
          end
        end
        Channel(channel).kick(m.user, "RAGEQUIT")
      end
    end
end
