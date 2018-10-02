require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret" #used by/with bcrypt gem
  end

  get '/' do  #opens index page
    erb :index
  end

  helpers do

    def logged_in?
        !!current_user
        # !!session[:user_id]
    end

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        # User.find(session[:user_id]) if session[:user_id]
      end
    end

end
