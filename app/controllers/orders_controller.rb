class OrdersController < ApplicationController
  def create
      order_params = params.require(:order).permit(:number, :product_id, :charge_id)
      @order = Order.new(order_params)
      respond_to do |format|
        if @order.save
          format.html { redirect_to @order.charge, notice: 'Order was successfully created.' }
          format.json { render action: 'show', status: :created, location: @order }
        else
          format.html { redirect_to @order }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
  end

  def destroy
    @order = Order.find(params[:order_id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to @order.charge }
      format.json { head :no_content }
    end
  end
end
