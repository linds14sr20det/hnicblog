class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def index
    @posts = Post.all.order('publish_date DESC').paginate(page: params[:page], :per_page => 12)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :publish_date, :user_id, :body, attachments_attributes: [:url])
    end

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
end