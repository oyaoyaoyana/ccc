class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update]
  def index
    @groups = Group.all
    @group_id = params[:group_id]
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: "グループを編集しました"
    else
      flash.update[:alert] = "グループ名を入力してください"
      render action: 'edit'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :user_ids)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
