# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid? && @user.save
      flash[:success] = 'User created successfully'
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    return render 'edit', status: :unprocessable_entity unless @user.update(user_params)

    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.', status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
