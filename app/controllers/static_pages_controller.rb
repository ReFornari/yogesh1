class StaticPagesController < ApplicationController
  def home
   @items = Orderitem.limit(3).order(id: :desc)
   @items = Item.all
  end
  
  def users
      @users = User.all
    
 # else 
 #   redirect_to "/"
    
 #  end 
  end
  
  def upgrade 
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, true)
    redirect_to "/"
  end
  
   def downgrade 
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, true)
    redirect_to "/"
  end

  def categories
  end

  def gallery
  end

  def about
  end
  
  def paid
   @order = Order.find_by(id: params[:id])
   @order.update_attribute(:status, "Paid by User: #{current_user.email}")
  end
end
