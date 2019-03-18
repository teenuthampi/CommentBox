class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_comment, only: [:create, :destroy]
  before_action :find_post, only:[:comment_trash,:comment_restore]

  def create
    @comment = @post.comments.create(params[:comment].permit(:user_name, :content))
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def comment_trash
    @comment.update_attributes(:status => "Deleted")
    respond_to do |format|
     format.html { redirect_to post_path(@post.id), notice: 'Trashed.' }
     format.json { head :no_content }
    end
  end

  def comment_restore
    @comment.update_attributes(:status => "Active")
    respond_to do |format|
     format.html { redirect_to post_path(@post.id), notice: 'Restored.' }
     format.json { head :no_content }
    end
  end


  private 

  def set_comment
    @post = Post.find(params[:post_id])
  end

  def find_post
    @post =  Comment.find(params[:id]).post
    @comment = @post.comments.find(params[:id]) 
  end


end
