module SessionsHelper
  def sign_in(user)
    print "\n\n\n\n>>>>>>>>>>>>>>>>>>>>>dsadasdsa<<<<<<\n\n\n"
    print user.remember_token
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    print "\n >>>>>>>>>>>>>DUPKA<<<<<<<<<<"
    cookies.delete(:remember_token)
  end


  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
end
