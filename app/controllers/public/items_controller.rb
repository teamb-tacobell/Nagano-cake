class Public::ItemsController < ApplicationController

    def index
      @items = Item.page(params[:page]).per(8)
      @items_all = Item.all
      @genre = Genre.all

    end

    def show
      @item = Item.find(params[:id])
      @genre = Genre.all
      @cart_item = CartItem
    end

    private

    def item_params
      params.require(:items).permit(:image, :name, :explanation, :genre_id, :tax_excluded_price, :is_sold)
    end
end