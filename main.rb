require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'

require_relative 'library/utils.rb'
require_relative 'models/posts.rb'
require_relative 'models/users.rb'

also_reload 'models/posts.rb'
also_reload 'models/users.rb'

enable :sessions

get '/' do

  # posts is array
  posts = get_all_posts

  erb :index, locals: { posts: posts }
end

get '/login' do
  erb :login
end

post '/session' do
  # will return false if can't find password
  user = get_user_by_email(params[:email])
  password_check = BCrypt::Password.new(user["password_digest"]) == params[:password]
  
  if user && password_check
    session[:user_id] = user["id"]
    redirect '/'
  else
    erb :login
  end
end

delete '/session' do
  session[:user_id] = nill
  redirect '/'
end




