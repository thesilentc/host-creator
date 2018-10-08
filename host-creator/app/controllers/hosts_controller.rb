class HostsController < ApplicationController


  get '/hosts' do
    # if the user is signed in?
    if logged_in?
    # render the hosts
    @hosts = Host.all
    erb :'hosts/hosts'
  else
    redirect '/login'
    end
  end


  get '/hosts/new' do #=> should present a form for new hosts
    if logged_in?
      erb :'hosts/create_host'
    else
      redirect to '/login'  # New controller action
    end
  end

  post '/hosts' do #=> CREATE, should add a new host
    if logged_in?
      if params[:content] == ""
        redirect to "/hosts/new"
      else
        @host = current_user.hosts.build(content: params[:content], hat_color: params[:hat_color])
        if @host.save #saves new host
          redirect to "/hosts/#{@host.id}" # redirects us to line 44 as next controller action
        else
          redirect to "/hosts/new" # redirects us to line 16 as new controller action
        end
      end
    else
      redirect to '/login'  # redirects us to new controller action in users_controller
    end
  end

  get '/hosts/:id' do
    if logged_in?
      @host = Host.find_by_id(params[:id])
      erb :'hosts/show_host'
    else
      redirect to '/login'
    end
  end

  get '/hosts/:id/edit' do
    if logged_in?
      @host = Host.find_by_id(params[:id])
      if @host && @host.user == current_user
        erb :'hosts/edit_host'
      else
        redirect to '/hosts'
      end
    else
      redirect to '/login'
    end
  end

  patch  '/hosts/:id' do  #=> PATCH instead of PUT allows both full and partial
                          #  updates to resources

    if logged_in?
      if params[:content] == ""
        redirect to "/hosts/#{params[:id]}/edit"
      else
        @host = Host.find_by_id(params[:id])
        if @host && @host.user == current_user
          if @host.update(content: params[:content])
            redirect to "/hosts/#{@host.id}"
          else
            redirect to "/hosts/#{@host.id}/edit"
          end
        else
          redirect to '/hosts'
        end
      end
    else
      redirect to '/login'
    end
  end

#verify and delete
  delete '/hosts/:id/delete' do #=> DESTROY/delete a host
    if logged_in?
      @host = Host.find_by_id(params[:id])
      if @host && @host.user == current_user
        @host.delete
      end
      redirect to '/hosts'
    else
      redirect to '/'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    end
  end

end
