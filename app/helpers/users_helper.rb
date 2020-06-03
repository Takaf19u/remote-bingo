module UsersHelper
  # セッションの維持の処理
  # session[:hoge]に値を代入すると、ブラウザ内のcookieに暗号化済みの値を自動的に作成してくれます。
  # (cookieメソッドの場合は、sessionメソッドと違ってブラウザを閉じた瞬間に消えてしまう）
  def log_in(user)
    session[:user_id] = user.id
  end

  # ユーザー情報の格納
  def current_user
    # ||= 自己代入
    # 変数(右辺)の中身が、
    # nilまたは、falseであれば、||=の右辺にある値を変数に代入する。
    # nilまたは、false以外であれば、変数の値をそのまま利用する。
    # @current_userが入っていない場合のみ、格納が行われるので、
    # 処理の高速化ができる。
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

end
