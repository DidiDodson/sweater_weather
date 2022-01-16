class Api::V1::SessionsController < ApplicationController
  def create
    if user = User.find_by_email(params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: UserSerializer.new(user).to_json, status: 200
      elsif params[:password].present? == false || params[:email].present? == false
        render json: {errors: {details: "Please enter a valid email or password"}}, status: 403
      end
    else
      render json: {errors: {details: "Please register."}}, status: 403
    end
  end
end
