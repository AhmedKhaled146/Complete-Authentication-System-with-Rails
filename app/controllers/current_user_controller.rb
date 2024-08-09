class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user, only: :update

  def show
    if params[:id].to_i == current_user.id
      render json: { message: "ID is correct", user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }, status: :ok
    else
      render json: { message: "ID is wrong" }, status: :unauthorized
    end
  end

  def update
    if params[:id].to_i == current_user.id
      if current_user.update(user_params)
        render json: { message: "User updated successfully", user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }, status: :ok
      else
        render json: { message: "There were errors", errors: current_user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "Unauthorized: ID does not match the current user" }, status: :unauthorized
    end
  end

  def change_password
    if params[:id].to_i == current_user.id
      if current_user.valid_password?(params[:old_password])
        if current_user.update(password_params)
          render json: { message: "Password updated successfully" }, status: :ok
        else
          render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { message: "Old password is incorrect" }, status: :unauthorized
      end
    else
      render json: { message: "Unauthorized: ID does not match the current user" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :username, :email, :address, :phone_number)
  end

  def password_params
    params.permit(:password, :password_confirmation)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
