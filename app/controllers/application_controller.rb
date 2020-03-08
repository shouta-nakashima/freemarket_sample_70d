class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private
    def production?
      Rails.env.production?
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

# BASIC認証の記述
# 2  5~8  本番環境でのみ認証をかけるメソッド、ビフォアクションを記述
# production?メソッドを定義し、現在の環境が本番環境ならtrue、そうでないならfalseを返すようにRails.env.production?と記述しています。
# before_action :basic_auth の後に、 if: :production?と記述することによって、本番環境のみでbasic_authメソッドが実行される