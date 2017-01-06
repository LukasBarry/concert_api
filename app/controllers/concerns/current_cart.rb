module CurrentCart
  private

  def find_cart
    @cart = Cart.find(session[:cart_id])
# TODO active record is not used in mongo.
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create(user_id: current_user.id)
    session[:cart_id] = @cart.id
  end
end
