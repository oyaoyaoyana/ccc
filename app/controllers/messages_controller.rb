class MessagesController < ApplicationController
  before_action :set_group, only: %i[index create]
  def index
    @message = Message.new
    @groups = current_user.groups
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
     respond_to do |format|
       format.html { redirect_to group_messages_path, notice: "投稿しました" }
       format.json
     end
    else
      flash.now[:alert] = "投稿してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def set_group
     @group = Group.find(params[:group_id])
     @messages = @group.messages.includes(:user)
  end

end

