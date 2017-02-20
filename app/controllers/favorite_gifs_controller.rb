class FavoriteGifsController < ApplicationController
  before_action :set_gif, only: [:create, :destroy]

  def index
    current_user.favorite_gifs
  end

  def create
     if Favorite.create(favorited: @gif, user: current_user)
       redirect_to :back, notice: 'Gif has been favorited'
     else
       redirect_to :back, alert: 'Something went wrong...*sad panda*'
     end
  end

  def destroy
    Favorite.where(favorited_id: @gif.id, user_id: current_user.id).first.destroy
    redirect_to :back, notice: 'Gif is no longer in favorites'
  end

   private

   def set_gif
     @gif = Gif.find(params[:gif_id] || params[:id])
   end
 end
#   def index
#     # @user = current_user
#     @gifs = current_user.favorite_gifs
#     # byebug
#   end
#
#   def show
#   end
#
#   def update
#     # @user = current_user
#     @favorite_gifs = current_user.favorite_gifs
#     @favorite_gifs.update(favorite_gifs_params)
#     if @favorite_gifs.save
#       flash[:success] = "Favorites updated!"
#       redirect_to category_gif_path
#     else
#       redirect_to :back
#     end
#   end
#
#   private
#
#   def favorite_gifs_params
#     params.require(:favorite_gifs).permit(:gif_id, :user_id, :type)
#   end
# end
