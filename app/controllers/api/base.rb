module API
  class Base < Grape::API
    prefix    'api'
    format    :json

    rescue_from :all, backtrace: true
    error_formatter :json, API::ErrorFormatter

    before do
      error!("401 Unauthorized", 401) unless authenticated
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by_auth_token(params[:access_token])
      end

      def current_user
        warden.user || @user
      end
    end

    mount API::V1::Base
    # mount API::V2::Root
  end
end
