require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'

require_relative 'config/application'

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end

get '/' do

  @meetups = Meetup.all

  erb :index
end

get '/meetups/:id' do

  @meetup = Meetup.find(params[:id])
  @meetup.members
  @joined = false

  if @meetup.members.exists?(user_id: session[:user_id])

    @joined = true

  end

  erb :show

end

post '/meetups/:id/join' do

  authenticate!

  @meetup = Meetup.find(params[:id])

  Member.create(user_id: session[:user_id], meetup_id: @meetup.id)

  flash[:notice] = "Successfully joined #{@meetup.name}!"

  redirect url("/meetups/#{@meetup.id}")

end

post '/meetups/:id/leave' do

  authenticate!

  @meetup = Meetup.find(params[:id])

  Member.where(:user_id => session[:user_id], :meetup_id => @meetup.id).destroy_all

  flash[:notice] = "Successfully left #{@meetup.name}!"

  redirect url("/meetups/#{@meetup.id}")

end

get '/auth/github/callback' do
  auth = env['omniauth.auth']

  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups/create/' do

  authenticate!

  erb :create

end

post '/meetups/create/' do

  authenticate!

  if params[:name] != "" && params[:location] != "" && params[:description] != ""

    @name = params[:name]
    @location = params[:location]
    @description = params[:description]

    @meetup = Meetup.create(name: @name, description: @description, location: @location, user_id: session[:user_id])

    Member.create(user_id: session[:user_id], meetup_id: @meetup.id)

    flash[:notice] = "Success! #{@meetup.name} Meetup created!"

    redirect url("/meetups/#{@meetup.id}")

  else

    flash[:notice] = "A name, location, and description is required to create a meetup."
    redirect '/meetups/create/'

  end

end
