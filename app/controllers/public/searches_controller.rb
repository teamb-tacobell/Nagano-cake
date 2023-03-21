class Public::SearchesController < ApplicationController
  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
  end
end
