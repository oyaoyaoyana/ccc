class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    @user = current_user
  end

    def new
      @group = Group.new
    end

  def create
    @group = current_user.groups.new(params[:name])
    if @group.save
      redirect_to group_messages_path(@group), notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを編集しました"
    else
      flash.update[:alert] = "グループ名を入力してください"
      render :edit
    end
  end

end
