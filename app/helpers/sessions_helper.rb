module SessionsHelper
  
  # 引数に渡されたユーザーオブジェクトでログインします。
  def log_in(user)
    session[:user_id] = user.id
  end
  
   # 永続的セッションを記憶します（Userモデルを参照
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # 永続的セッションを破棄します
  def fotget(user)
    user.forget # Userモデル参照
    coolies.delete(:user_id)
    coolies.delete(:remember_token)
  end
  
  # セッションと@current_userを破棄します
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # 一時的セッションにいるユーザーを返します。
  # それ以外の場合はcookiesに対応するユーザーを返します。
  def current_user
    if (user_id = session[:usera_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cllkies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # 現在ログイン中のユーザーがいる場合オブジェクトを返します
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # 現在ログイン中のユーザーがいればtrue、そうでなければfalseを返します。
  def logged_in?
    !current_user.nil?
  end
end
