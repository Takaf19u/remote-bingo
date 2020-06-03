class UsersController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # セッションの維持の処理呼び出し
      log_in user
      # ユーザログイン後にadminページに遷移する
      redirect_to root_path
    else
      flash.now[:danger] = 'emailまたはpasswordが間違っています'
      redirect_to root_path
    end
  end

  def destroy
  end
end
