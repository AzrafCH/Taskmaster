require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "onepasswordtorulethemall"
    #register Sinatra::Flash
  end

  get "/" do
    erb :home
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
