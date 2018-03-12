class BlogPostsController < ApplicationController
  def index
    @posts = Post.where('publish_date <= ?', DateTime.now).order('publish_date DESC').paginate(page: params[:page], :per_page => 12)
  end

  def show
    @post = Post.find(params[:id])
    redirect_to blog_posts_path unless @post.publish_date <= DateTime.now
  end
end