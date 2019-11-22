class PostsController < ApplicationController
  before_action :signed_in?, only: %i[new create]
  
  def index
  end

  def new
  end

  def create
     @post = Post.new(post_params)

     if @post.save
      redirect_to root_path, notice: 'Post added successfully'
     else
      render :new
     end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
