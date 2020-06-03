module UsersHelper
  # セッションの維持の処理
  # session[:hoge]に値を代入すると、ブラウザ内のcookieに暗号化済みの値を自動的に作成してくれます。
  # (cookieメソッドの場合は、sessionメソッドと違ってブラウザを閉じた瞬間に消えてしまう）
  def log_in(user)
    session[:user_id] = user.id
  end
end
