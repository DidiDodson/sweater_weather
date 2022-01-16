class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params) do |user|
          user.api_key = SecureRandom.uuid
        end
    if user.save
      render json: UserSerializer.new(user).to_json, status: 201
    elsif params[:password].present? == false || params[:email].present? == false
      render json: {errors: {details: "Please enter a valid email or password"}}, status: 403
    elsif User.exists?(email: params[:email]) == true
      render json: {errors: {details: "Please enter a unique email."}}, status: 403
    elsif params[:password_confirmation] != params[:password] || params[:password_confirmation].present? == false
      render json: {errors: {details: "Your passsword and password confirmation do not match."}}, status: 401
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
