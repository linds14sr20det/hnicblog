class BlogPostsController < ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], :per_page => 12)
  end

  def show
    @post = Post.find(params[:id])
  end
end