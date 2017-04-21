class Bnb < Sinatra::Base

  get '/sessions/new' do
    if current_user
      flash.now[:logged_in_warning] = "You are already logged in"
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
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:log_out_notice] = "Successfully logged out"
    redirect to '/apartments'
  end
end
