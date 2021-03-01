class CommentsController < ApplicationController
  before_action :find_post, only: %i[create update]
  before_action :find_comment, only: %i[destroy update]

  def create
    if comment_params_valid?
      Comment.create( comment_params )
    else
      flash[ :error ] = 'Your comment is blank or something is wrong'
    end

    redirect_to post_path( @post )
  end

  def update
    if @comment.update( comment_params )
      redirect_to post_path( @post )
    else
      render action: 'edit'
    end
  end

  def destroy
    @comment.destroy

    redirect_to post_path( @comment.post )
  end

  private

  def find_post
    @post = Post.find( comment_params[ :post_id ] )
  end

  def find_comment
    @comment = Comment.find( params[ :id ] )
  end

  def comment_params_valid?
    comment_params[ :message ].present? &&
      comment_params[ :post_id ].present? &&
      comment_params[ :user_id ].present?
  end

  def comment_params
    params.require( :comment ).permit( :id, :post_id, :message ).merge( user_id: current_user.id )
  end
end
