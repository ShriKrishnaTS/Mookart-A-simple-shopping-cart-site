class CartController < ApplicationController
  def add
    current_order
    @order.save
    logger.info "Saved order id is #{@order.id}"
    session[:order_id] = @order.id
    product = Product.find params[:id]
    LineItem.create line_itemable: product, order: @order, amount: product.price
    @order.calculate_total
    redirect_to cart_url, notice: "#{product.name} added to cart!"
  end

  def show
    @order = current_order
    logger.info session[:order_id]
  end

  def remove
    current_order
    item = @order.line_items.find params[:id]
    item.destroy
    @order.calculate_total
    redirect_to cart_url, notice: 'Item removed'
  end

  def checkout
    authenticate_user!
    current_order
  end

  def success
    current_order
    @order.update status: 'Paid'
  end
end
