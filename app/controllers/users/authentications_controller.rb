class Users::AuthenticationsController < ApplicationController
  skip_before_action :require_login, only: %i[show callback]

  before_action :set_user, only: [:callback]

  def show
    session[:return_to] = request.referer
    login_at(params[:provider])
  end

  def destroy
    provider = params[:provider]
    @authentication = current_user.authentications.find_by!(provider: provider)
    @authentication.destroy
    redirect_back fallback_location: root_path, notice: "#{provider.titleize}との連携を解除しました"
  end

  def callback
    provider = params[:provider]

    if @user
      redirect_to return_to
    elsif logged_in?
      add_provider_to_user(provider)
      redirect_to return_to, notice: "#{provider.titleize}と連携しました"
    else
      begin
        @user = create_from(provider)

        reset_session
        auto_login(@user)

        redirect_to return_to
      rescue StandardError => e
        logger.warn "[Users::AuthenticationsController#callback] #{e.message}"
        redirect_to return_to, alert: 'ログインに失敗しました'
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end

  def set_user
    @user = login_from(auth_params[:provider])
  end

  def return_to
    @return_to ||= (session.delete(:return_to) || root_path)
  end
end
