class PagesController < ApplicationController
  def about
  end

  def trash
  	@posts = Post.where(:status => "Deleted").includes(:comments)
  	@comments = Comment.where(:status => "Deleted")
  end

end
