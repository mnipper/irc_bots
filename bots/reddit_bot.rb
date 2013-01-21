require 'cinch'
require 'ruby_reddit_api'

class RedditBot
  include Cinch::Plugin
    match /reddit r\/(.+)/, method: :subreddit_list
    match /reddit search r\/(.+)/, method: :subreddit_search

    def initialize(*args)
      super
      @r = Reddit::Api.new
    end

    def subreddit_list(m, subreddit)
      results = @r.browse subreddit
      results[0..4].each do |submission|
        m.reply("#{submission.title} http://reddit.com/#{submission.id[3..-1]}") 
      end
      sleep 3
    end

    def subreddit_search(m, query)
      subreddit = query.split[0]
      search_term = query.split[1..-1]
      results = @r.browse subreddit
      search_results = results.select{|r| r.title =~ /#{search_term.join(' ')}/i}
      if search_results.length > 0
        submission = search_results.first
        m.reply("#{submission.title} http://reddit.com/#{submission.id[3..-1]}") 
      else
        m.reply("Could not find anything...")
      end
      sleep 3
    end
end
