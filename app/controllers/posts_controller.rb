class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update ]
  before_action :set_post, only: [ :update, :edit ]
  before_action :authorize_user!, only: [ :update, :edit ]

  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @post is set by set_post
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    redirect_to posts_path, alert: "Not allowed!" unless @post.user == current_user
  end
  def post_params
    params.expect(post: [ :title, :body ])
  end
end
