class MessagesController < ApplicationController
  def index
    @groups = Group.all
    @group_id = params[:group_id]
    @group = Group.first
  end
end
