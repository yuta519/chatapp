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
end
