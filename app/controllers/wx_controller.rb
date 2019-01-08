class WxController < ApplicationController
  def index
    render json: {status: 200, message: "ok"}
  end
  def recieve
    @user = User.find_by(id: params[:id])
    render text: "aaa"    
  end
end