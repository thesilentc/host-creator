require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret" # creates an encrypted session_id unique to the user's session and stored in the browser as a cookie
  end

  get '/' do  #opens index page
    erb :index
  end

  helpers do

    def logged_in?
        !!current_user

    end

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]

      end
    end

end
