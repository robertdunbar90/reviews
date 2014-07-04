class ItemsController < ApplicationController

def index
  @items = Item.all
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

  private

    def item_params
      params.require(:item).permit(:title, reviews_attributes: [:reviewer, :review, :rating])
    end
end
