class HomeController < ApplicationController
  def index
    @my_posts = Post.where( user_id: current_user.id ) if current_user
    @posts = Post.all.includes( :user ).includes( :comments ).limit( 10 )
  end

  def about; end
end
