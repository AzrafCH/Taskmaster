require './config/environment'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "onepasswordtorulethemall"
    register Sinatra::Flash
  end

  get "/" do
    erb :home
  end

  get '/bleh' do
  if flash[:blah]
    # The flash collection is cleared after any request that uses it
    "Have you ever felt blah? Oh yes. #{flash[:blah]} Remember?"
  else
    "Oh, now you're only feeling bleh?"
  end
end

  helpers do

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        #flash[:message] = "You must be logged in to view that page."
        redirect to '/login'
      end
    end

  end
end
