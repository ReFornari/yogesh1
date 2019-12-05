class CartController < ApplicationController

  def add
    # get the Id of the product
    id = params[:id]
    
   # if the cart is already been created, use existing cart else create a blank cart
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    #If the product is already added it increments by 1 else product set to 1
    if cart[id] then
      cart[id] = cart[id] + 1
    else
      cart[id]= 1
    end  
  
    redirect_to :action => :index
  
  end

  def index
    # passes a cart to display
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end  
  end


##delete Item##
  def remove
    
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :root
  end
  
  ##clear cart##

  def clearCart
    # clear cart and remove all items 
    session[:cart] = nil
    redirect_to :action => :index
    
  end
  
  ##decrease the quantity## 


  def decrease
    
    id = params[:id]
    cart = session[:cart]
    if cart[id] == 1 then
       cart.delete id
    else
     cart[id] = cart[id] - 1
    end
     #Taking us to cart index[view] page
    redirect_to :action => :index
    
  end
  
    ##createOrder##
  
def createOrder
    # step 1 find out who is actually placing the order
 @user = User.find(current_user.id)

   # Step 2 actually make the order we wnt to keep in our database
 @order = @user.orders.build(:order_date => DateTime.now, :status => "Pending")
 @order.save
   
   # Step 3 - Take all items from current cart and associate them with the order
   
 @cart = session[:cart] || {} # This gets the content from the current shopping cart
 @cart.each do | id, quantity| 
   item = Item.find_by_id(id)
   @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :quantity => quantity, :price => item.price)
 @orderitem.save
 end
    
  redirect_to '/'
end 
end
