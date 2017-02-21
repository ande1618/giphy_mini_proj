class GifsController < ApplicationController
  require 'json'
  require 'faraday'
  before_action :authorize!, except: [:show, :index]

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @gifs = @category.gifs
    elsif params[:category]
      @gifs = Gif.where("gif.category.title = ?", params[:category_id])
    else
      @gifs = Gif.all
    end
  end

  def new
    @categories = Category.all.order(:title)
    @gif = Gif.new
  end

  def create
      category = Category.find(params[:category][:category_id])
      query = params[:search]
        response = Faraday.get("http://api.giphy.com/v1/gifs/search?q=#{query}&api_key=dc6zaTOxFJmzC")
        body = response.body
        parsed = JSON.parse(body, :symbolize_names => true)
        img_url = parsed[:data].sample[:images][:original].fetch(:url)

        @gif = category.gifs.create(image_path: img_url)
        flash[:success] = "Gif created successfully"
        redirect_to gifs_path
  end

  def show
    @gif = Gif.find(params[:id])
  end

  private

  def gif_params
    params.require(:gif).permit(:image_path, :category_id)
  end

end
