class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      #user && user.authenticate(params[:session][:password])
      #ログイン後にユーザー情報のページへリダイレクト
      log_in user
      redirect_to user
    else
      #フラシュでエラーメッセージ
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
