class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_object, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def update
    respond_to do |f|
      if @user.update_attributes(params[:user])
        f.html { redirect_to user_path(@user), notice: "User was successfully updated!" }
      else
        f.html { render action: :edit }
      end
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |f|
      if @user.save
        f.html { respond_to user_path(@user), notice: "User was successfully created!" }
      else
        f.html { render action: :new }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |f|
      f.html { redirect_to users_url, notice: "User was successfully deleted!" }
    end
  end

  private

  def get_object
    @user = User.find(params[:id])
  end
end
