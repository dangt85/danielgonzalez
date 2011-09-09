require 'twitter'

class TweetsController < ApplicationController

  # GET /tweets/:page
  def index
    @total_tweets = Rails.cache.fetch('total_tweets') { Twitter.user('dangt85').statuses_count }
    @tweets = Twitter.user_timeline('dangt85', :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
    end
  end
end
