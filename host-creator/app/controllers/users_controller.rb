class UsersController < ApplicationController



  get '/signup' do
    if !logged_in?
      erb :'users/create_user', locals: {message: "Please start by creating a username first."}
    else
      redirect to '/hosts'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/hosts'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/hosts'
    end
  end



  post '/login' do
    # user = User.find_by(:username => params[:username])
    @user = User.find_by(:username => params[:username])   #=> @user is instance variable
    if user && user.authenticate(params[:password])
      # session[:user_id] = user.id
      session[:user_id] = @user.id                        #  @user.id is instance variable
      redirect to "/hosts"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

end
