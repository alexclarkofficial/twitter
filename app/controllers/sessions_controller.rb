class SessionsController < ApplicationController

  def new
    redirect_to request_token.authorize_url
  end

  def create
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    session.delete(:request_token)
    session[:oauth_token] = access_token.params[:oauth_token]
    session[:oauth_token_secret] = access_token.params[:oauth_token_secret]
    redirect_to root_path
  end

  def destroy
    session[:oauth_token] = nil
    session[:oauth_token_secret] = nil
    redirect_to root_path
  end

end