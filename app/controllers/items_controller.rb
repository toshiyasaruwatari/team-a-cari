class ItemsController < ApplicationController

  def index

    @categories = Category.all

    ladies_category = Category.find(1)
    ladies = Category.descendants_of ladies_category
    @ladies_items = Item.includes(:item_images).where(category_id: ladies.ids).order("created_at DESC").limit(4)

    mens_category = Category.find(2)
    mens = Category.descendants_of mens_category
    @mens_items = Item.includes(:item_images).where(category_id: mens.ids).order("created_at DESC").limit(4)

    kids_category = Category.find(3)
    kids = Category.descendants_of kids_category
    @kids_items = Item.includes(:item_images).where(category_id: kids.ids).order("created_at DESC").limit(4)

    @chanel_items = Item.includes(:item_images).where(brand_id: 1).order("created_at DESC").limit(4)
    @lui_items = Item.includes(:item_images).where(brand_id: 3).order("created_at DESC").limit(4)
    @sup_items = Item.includes(:item_images).where(brand_id:4).order("created_at DESC").limit(4)
    @nike_items = Item.includes(:item_images).where(brand_id: 2).order("created_at DESC").limit(4)

  end

  def trade_sell
  end

  def trade_now
  end

  def trade_sold
  end

  def pay_way
  end

  def new
    @item = Item.new
    @item.item_images.build

    respond_to do |format|
      format.html
      format.json { @children = Category.children_of(params[:parent_id]) }
    end
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def change
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(update_params)
    redirect_to action: 'change'
  end

  def destroy
    @item = Item.find(params[:id])

  end

  def logout
  end

  def buy
  end

  private
  def create_params
    params.require(:item).permit(:name, :price, :describe, :size_id, :brand_id, :status, :burden, :delivery_method, :prefecture, :delivery_day, :category_id, item_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:name, :price, :describe, :size_id, :brand_id, :status, :burden, :delivery_method, :prefecture, :delivery_day, :category_id, item_images_attributes: [:id , :item_id, :image]).merge(seller_id: current_user.id)
  end

end
