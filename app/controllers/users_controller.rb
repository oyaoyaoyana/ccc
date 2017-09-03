class UsersController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  before_action :check_group, only: [:edit]

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
       format.html
       format.json
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.update
      redirect_to root_path
     else
      flash.now[:alert] = "名前を入力してください"
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "名前を登録しました"
    else
      flash.now[:alert] = "名前を入力してください"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_group
   @user = User.find(params[:id])
  end

  def check_group
    redirect_to root_path unless @user.id == current_user.id
  end
end



