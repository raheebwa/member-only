# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :signed_in?, only: %i[new create]

  def index
    @posts = Post.all
    @signed_in = current_user.present?
  end

  def new; end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      redirect_to root_path, notice: 'Post added successfully'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
