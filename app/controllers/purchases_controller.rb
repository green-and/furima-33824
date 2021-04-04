class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_item_user, only: [:index, :create]
  before_action :item_soldout, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:user_id, :item_id, :postcode, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def current_item_user
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_soldout
    @item = Item.find(params[:item_id])
    if Purchase.exists?(@item.id)
      redirect_to root_path
    end
  end
end
