class ItemsController < ApplicationController
  def index
    @categories = Category.roots.limit(4)
    @brands = Brand.limit(3)
    @items = Item.all
    @image = ItemImage.find(1)
  end

  def new
  end

  def card
  end

  def card_add
  end

  def identification
  end

  def item_buy
  end

  def logout
  end

  def detail
  end

  def edit
  end

  def mypage
  end

  def membership
  end

end
