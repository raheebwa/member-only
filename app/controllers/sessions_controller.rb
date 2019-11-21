# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
