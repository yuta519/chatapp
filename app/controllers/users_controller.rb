# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create; end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    return render 'edit', status: :unprocessable_entity unless @user.update(user_params)

    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
