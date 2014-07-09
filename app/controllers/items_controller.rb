class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :destroy

  def index
    @items = Item.order(:title).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.all
  end

  def new
    @item = Item.new
    @item.reviews.build
  end

  def create
    @item = Item.new(item_params)

    @item.save
    redirect_to @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end

  def about
  end

  def sitemap
    @items = Item.all
  end

  private

    def item_params
      params.require(:item).permit(:title, reviews_attributes: [:reviewer, :review, :rating])
    end
end
