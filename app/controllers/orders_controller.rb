class OrdersController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    order  = Order.create!(product_sku: product.sku, amount: product.price, state: 'pending', user: current_user)
    redirect_to new_order_payment_path(order)
  end
  def show
    @order = current_user.orders.find(params[:id])
    @order.update(payment: 'done', state: 'paid')
    flash[:notice] = "Paiement validé avec succés"
  end
end
