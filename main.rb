require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'
require 'cloudinary'

require_relative 'library/utils.rb'
require_relative 'models/posts.rb'
require_relative 'models/users.rb'

also_reload 'models/posts.rb'
also_reload 'models/users.rb'

enable :sessions

options = {
  cloud_name: ENV["CLOUDINARY_NAME"],
  api_key: ENV["CLOUDINARY_KEY"],
  api_secret: ENV["CLOUDINARY_SECRET"]
}

get '/' do

  # posts is array
  posts = get_all_posts

  erb :index, locals: { posts: posts }
end

get '/login' do
  erb :login
end

get '/new_post' do
  redirect '/login' unless logged_in?

  erb :new_post
end

get '/new_user' do
  erb :new_user
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
  user_id = session[:user_id]

  file = params[:image_url][:tempfile]
  image_url = Cloudinary::Uploader.upload(file, options)["url"]

  create_post(sport, difficulty, location, image_url, user_id)

  redirect '/'
end

get '/my_posts' do
  redirect '/' unless logged_in?
  posts = get_posts_by_user(current_user["id"])
  erb :user_posts, locals: { posts: posts }
end

put '/posts/:id' do
  redirect '/login' unless logged_in?
  
  id = params[:id]
  sport = params[:sport] 
  difficulty = params[:difficulty] 
  location = params[:location] 

  file = params[:image_url][:tempfile]
  image_url = Cloudinary::Uploader.upload(file, options)["url"]

  update_post(id, sport, difficulty, location, image_url)

  redirect '/'
end

delete '/posts/:id' do
  redirect '/login' unless logged_in?

  delete_post(params[:id])

  redirect '/'
end

post '/users' do
  first_name = params[:first_name] 
  last_name = params[:last_name]
  user_name = params[:user_name] 
  user_name_invalid = user_name_in_use? user_name

  email = params[:email]
  email_invalid = email_in_use? email


  file = params[:profile_img][:tempfile]

  profile_img = Cloudinary::Uploader.upload(file, options)["url"]

  password = params[:password] 
  password_digest = BCrypt::Password.create(password)

  unless (email_invalid || user_name_invalid)
    create_user(user_name, first_name, last_name, email, profile_img, password_digest)
    user = get_user_by_email(email)
    session[:user_id] = user["id"]
    redirect '/'
  end

  erb :in_use
  
end

get '/users/:id/profile_img/edit' do
  redirect '/login' unless logged_in?
  erb :edit_prof_pic
end

put '/users/:id/profile_img/edit' do
  redirect '/' unless logged_in?
  
  id = params[:id]
  file = params[:profile_img][:tempfile]

  profile_img = Cloudinary::Uploader.upload(file, options)["url"]

  change_profile_picture(id, profile_img)

  redirect '/my_posts'
end

get '/users/:id/password/edit/authenticated' do
  redirect '/' unless logged_in?

  user = current_user

  password_check = BCrypt::Password.new(user["password_digest"]) == params[:password]

  if password_check 
    erb :edit_password
  else
    erb :authenticate_user
  end
end

get '/users/:id/password/edit' do
  redirect '/' unless logged_in? 
  erb :authenticate_user
end

put '/users/:id/password/edit' do
  redirect '/' unless logged_in?

  id = current_user["id"]
  password = params[:password]
  password_digest = BCrypt::Password.create(password)

  change_password(id, password_digest)

  redirect '/my_posts'
end

get '/user_posts/:id' do
  posts = get_posts_by_user(params[:id])
  erb :user_posts, { locals: { posts: posts }}
end

