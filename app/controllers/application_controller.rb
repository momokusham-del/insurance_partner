class ApplicationController < ActionController::Base
  # お店に入る前に、必ずログインしているか確認する「門番」を配置！
  before_action :authenticate_user!
end