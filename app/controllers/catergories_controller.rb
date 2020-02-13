class CatergoriesController < ApplicationController

  get '/category' do
    @user = current_user
    redirect_if_not_logged_in
    @categories = Category.all
    erb :'/categories/categories'
  end

end
