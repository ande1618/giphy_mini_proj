class CategoriesController < ApplicationController
  before_action :authorize!, except: [:show, :index]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  # def show
  #   @category = Category.find(params[:id])
  # end

  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path
      else
        render :new
      end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "#{@category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
