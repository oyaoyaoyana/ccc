
class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params) if user.id == current_user.id
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
