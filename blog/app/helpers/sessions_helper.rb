module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attributes(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def sign_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user=(user)
    @curret_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @curret_user ||= User.find_by(remember_token: remember_token)
  end
end
