class BlogsController < ApplicationController

  before_action :move_to_index, except: [:index,:show]
  before_action :set_blog, only: [:destroy,:edit,:update,:show]
  def index
    @blogs = Blog.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
      respond_to do |format|
      format.html{}
      format.js {}
      end
  end


  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end

  end

  def destroy
    @blog.destroy if user_signed_in?
  end

  def edit
  end

  def update
    @blog.update(blog_params) if user_signed_in?
  end

  def show
  end

  def search
    @blogs = Blog.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
