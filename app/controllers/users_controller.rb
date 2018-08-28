class UsersController < ApplicationController
  before_action :set_user, only: %i[update show destroy take_number]

  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @user = User.create(user_params)
    json_response(@user, :created)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def show
    json_response(@user)
  end

  def destroy
    @user.destroy
    head :no_content
  end

  def take_number
    num = params[:user][:phone] || Phone.random_phone
    @phone = @user.phones.build(number: num)
    if @phone.save
      json_response(@phone, :created)
    else
      render json: @phone.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
