class CatergoriesController < ApplicationController

  get '/categories' do
    @user = current_user
    redirect_if_not_logged_in
    @category = Category.all
    erb :'/categories/categories'
  end

  get '/categories/new' do
    redirect_if_not_logged_in
    @tasks = Task.all
    erb :'/categories/new'
  end

  post '/categories' do
    if logged_in?
      if params["task"]["name"] == "" || params["task"]["content"] == "" || params["name"]
        session[:category] = params["name"]
        session[:name] = params["task"]["name"]
        session[:content] = params["task"]["content"]
        erb :'/categories/new'
      else
        @user = current_user
        @category = Category.create(params[:name])
        @category.tasks << Task.create(name: params["task"]["name"], content: params["task"]["content"])
        @category.save
        redirect to '/categories/categories'
      else
        redirect to '/categories/new'
      end
    end
  else
    redirect to '/user/login'
  end
end

    get '/categories/:id/edit' do
      @category = Category.find(params[:id])
      @tasks = Task.all
      erb :'/categories/edit'
    end

    get '/categories/:id' do
      @category = Category.find(params[:id])
      erb :'/categories/show'
    end

    patch '/categories/:id' do
      @category = Category.find(params[:id])
      @category.update(params[:name])
      if !params["task"]["name"].empty?
        @category.tasks << Task.create(name: params["task"]["name"], content: params["task"]["content"])
      end
      redirect "/categories/#{@category.id}"
    end
end

#I have to add categories, in which tasks get placed into a certain category.
