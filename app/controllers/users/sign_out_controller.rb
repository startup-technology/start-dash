class Users::SignOutController < ApplicationController
  def destroy
    logout
    redirect_to root_url, notice: 'ログアウトしました'
  end
end
