class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_post, only: [:edit, :update, :show, :destroy]


  def index
    @posts = Post.where(:status => "Active").includes(:comments).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  def trashposts
    @post = Post.where(:id => params[:id]).first
    @post.update_attributes(:status => "Deleted")
    respond_to do |format|
     format.html { redirect_to posts_path, notice: 'Trashed.' }
     format.json { head :no_content }
    end
  end

  def restore
    @post = Post.where(:id => params[:id]).first
    @post.update_attributes(:status => "Active")
    respond_to do |format|
     format.html { redirect_to post_path(@post.id), notice: 'Post Restored.' }
     format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post).permit(:title, :body)
    end

end
