class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i[show edit update destroy]
  before_action :check_abilities, only: [ :destroy ]

  def new; end

  def create
    @post = Post.new( post_params )
    attach_file if params[ :post ][ :file ].present?

    if post_params_valid?
      @post.save

      redirect_to post_path( @post )
    else
      flash[ :error ] = 'Fields must be filled'
      render action: 'new'
    end
  end

  def show
    @comments = Comment.where( post_id: @post.id )
  end

  def edit; end

  def update
    attach_file if params[ :post ][ :file ].present?

    if @post.update( post_params )
      redirect_to post_path( @post )
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find( params[ :id ] )
  end

  def post_params_valid?
    post_params[ :title ].present? &&
      post_params[ :content ].present? &&
      post_params[ :user_id ].present?
  end

  def check_abilities
    current_user.admin? || post_belongs_to_current_user?
  end

  def post_belongs_to_current_user?
    current_user.id == @post.user_id
  end

  def attach_file
    @post.file.attach( params[ :post ][ :file ] )
  end

  def post_params
    params.require( :post ).permit( :title, :content ).merge( user_id: current_user.id )
  end
end
