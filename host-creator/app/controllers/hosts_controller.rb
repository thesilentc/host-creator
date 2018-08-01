class HostsController < ApplicationController
  get '/hosts' do
    if logged_in?
      @hosts = Host.all
      erb :'hosts/hosts'
    else
      redirect to '/login'
    end
  end

  get '/hosts/new' do
    if logged_in?
      erb :'hosts/create_host'
    else
      redirect to '/login'
    end
  end

  post '/hosts' do
    if logged_in?
      if params[:content] == ""
        redirect to "/hosts/new"
      else
        @host = current_user.hosts.build(content: params[:content])
        if @tweet.save
          redirect to "/hosts/#{@tweet.id}"
        else
          redirect to "/hosts/new"
        end
      end
    else
      redirect to '/login'
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

  patch '/hosts/:id' do
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
  delete '/hosts/:id/delete' do
    if logged_in?
      @host = Host.find_by_id(params[:id])
      if @host && @host.user == current_user
        @host.delete
      end
      redirect to '/hosts'
    else
      redirect to '/login'
    end
  end
end
