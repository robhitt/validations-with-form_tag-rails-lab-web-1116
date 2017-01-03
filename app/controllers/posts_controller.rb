class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # Define the "valid path" for the create and update controller actions.
    # Define the "invalid path" for the create and update controller actions.
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render new #new_post_path(@post)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # Define the "valid path" for the create and update controller actions.
    # Define the "invalid path" for the create and update controller actions.

    # PostsController making invalid updates renders the form again
    # Failure/Error: expect(response).to render_template(:edit)
    # expecting <"edit"> but was a redirect to <http://test.host/posts/1>
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
