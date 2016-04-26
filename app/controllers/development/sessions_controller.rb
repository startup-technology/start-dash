class Development::SessionsController < ActionController::Base
  def login_as
    user = User.find(params[:user_id])
    auto_login(user)
    redirect_to root_url, notice: "Signed in! [#{user.id}]"
  end
end
