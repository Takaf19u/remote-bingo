class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # セッションの維持の処理を読みこみ
  include SessionsHelper

end
