class WxController < ApplicationController
  @@token="chengzi"

  def index
    render json: {status: 200, message: "ok"}
  end

  def recieve
    @user = User.find_by(id: params[:id])
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
      return render text: params[:echostr]
    end
  end

  private
  
  def check_signature?(signature,timestamp,nonce)
    Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature
  end
end