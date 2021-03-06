# frozen_string_literal: true

module Home
  class ItemsController < HomeController
    def index
      # @category = Category.find(params["category_id"])
      # @items = @category.items
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
      ahoy.track "Show_item", item_id: @item.id
      @categories = @item.categories

      return unless current_user

      @products = []
      @cart = Cart.find(current_user.cart.id)
      CartItem.where(cart_id: @cart.id).each { |cart_item| @products << cart_item.item }
    end
  end
end
