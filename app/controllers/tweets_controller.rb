class TweetsController < ApplicationController

  before_filter :authorize_user

  def index
    set_twitter_client
    @username = Twitter.user.attrs[:name]
    @tweets = Twitter.user_timeline(@username)
  end

  def new
  end

  def create
    set_twitter_client
    begin
      Twitter.update(params[:tweet])
    rescue Exception
      flash[:error] = "Twitter Failed"
      redirect_to tweets_new_path and return
    end
    flash[:success] = "Tweet successfully posted"
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end
end