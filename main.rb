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

get '/share' do
  redirect '/login' unless logged_in?

  erb :new_post
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
  session[:user_id] = nil
  redirect '/'
end

get '/posts/:post_id/edit' do
  redirect '/login' unless logged_in?

  post = get_post_by_id(params[:post_id])

  erb :edit_post, locals: { post: post }
end

get '/posts/:id' do
  post = get_post_by_id(params[:id])
  erb :post_details, locals: { post: post }
end

post '/posts' do
  redirect '/login' unless logged_in?

  sport = params[:sport]
  difficulty = params[:difficulty]
  location = params[:location]
  image_url = params[:image_url]
  user_id = session[:user_id]

  create_post(sport, difficulty, location, image_url, user_id)

  redirect '/'
end

get '/my_posts' do
  posts = get_posts_by_user(current_user["id"])
  erb :my_posts, locals: { posts: posts }
end

put '/posts/:id' do
  redirect '/' unless logged_in?
  
  id = params[:id]
  sport = params[:sport] 
  difficulty = params[:difficulty] 
  location = params[:location] 
  image_url = params[:image_url] 
  update_post(id, sport, difficulty, location, image_url)
  
  redirect '/'
end




