class MessagesController < ApplicationController
  before_action :set_group

  def index

    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    #データを保存するタイミングでpermitで確認するためにmessage_paramsを呼び出してチェックしている
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力して下さい。'
      render :index
    end
      # redirect_to root_path, notice: 'メッセージを入力して下さい'
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    #ストロングパラメータで保存データのチェック
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
