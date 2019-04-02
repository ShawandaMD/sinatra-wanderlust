class UserController < ApplicationController

  get '/signup' do
    erb :'/user/signup'
  end

  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      if params[:name] == "" || params[:email] == "" || params[:password] == ""
        redirect to "/signup/failure"
      else
        @user.save
        session[user_id] = @user.id
        redirect to "welcome/:id/:name"
      end
  end

  get '/login' do
    erb :"/user/login"
  end

  post '/login' do
    @user = User.find_by(params[:email])
    

  end

  get '/signup/failure' do
    erb :"/user/signup_failure"
  end


end
