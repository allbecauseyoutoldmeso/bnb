class Bnb < Sinatra::Base

  get '/sessions/new' do
    if current_user
      flash.keep[:warning] = "You are already logged in"
      redirect to '/apartments'
    else
    erb :'sessions/log_in'
    end
  end

  post '/sessions' do
    if User.authentic?(params[:email], params[:password])
      user = User.first(email: params[:email])
      session[:user_id] = user.id
      redirect to '/apartments'
    else
      flash.next[:error] = "Invalid username or password"
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Successfully logged out"
    redirect to '/apartments'
  end
end
