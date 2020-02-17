class CatergoriesController < ApplicationController

  get '/categories' do
      @category = Category.all
      erb :'/categories/categories'
    end

    get '/categories/new' do
      @tasks = Task.all
      erb :'/categories/new'
    end

    post '/categories' do
      @category = Category.create(params[:name])
      if !params["task"]["name"].empty?
        @category.tasks << Task.create(name: params["task"]["name"], content: params["task"]["content"])
        # When using the shovel operator, ActiveRecord instantly fires update SQL
        # without waiting for the save or update call on the parent object,
        # unless the parent object is a new record.
      end
      redirect "/categories/#{@category.id}"
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
