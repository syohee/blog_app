class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :edit, :update, :destroy, :show]
  
  def top
  end
  
  def index
    @blog = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end
  
  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
end
