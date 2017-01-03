class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new #new_post_path(@post)
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.new(author_params)
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
