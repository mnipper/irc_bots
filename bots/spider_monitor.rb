require 'cinch'

class SpiderMonitor
  include Cinch::Plugin

  timer 5, method: :monitor

  def initialize(*args)
    super
    @matt = :init
  end

  def monitor
    if `users`.include?("matt") && @matt != :here
      Creds.channels.each do |channel|
        Channel(channel).send "** MATT IS IN THE SERVER! ALERT! **"
      end
      @matt = :here
    end
    if !`users`.include?("matt") && @matt == :here
      Creds.channels.each do |channel|
        Channel(channel).send "** MATT IS GONE!  We are safe, for now... **"
      end
      @matt = :gone
    end
  end

end
