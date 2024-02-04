# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid? && @user.save
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

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
