class ItemsController < ApplicationController
  def index
    @categories = Category.roots.limit(4)
    @brands = Brand.limit(3)
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.item_images.build
    respond_to do |format|
      format.html
      format.json { @childrens = Category.children_of(params[:parent_id]) }
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
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

  private
  def item_params
    params.require(:item).permit(:name, :price, :describe, :status, :burden, :delivery_method, :prefecture, :delivery_day, :seller_id, :category_id, images_attributes: [:image])
  end

end
