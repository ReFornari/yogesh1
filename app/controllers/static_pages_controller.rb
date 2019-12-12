class StaticPagesController < ApplicationController
  def home
   @items = Item.all
  end

  def upgrade_admin
   @user.update_attribute(:adminrole, true)
   redirect_to :action => :admin_users
  end
   
  def downgrade_admin
   @user.update_attribute(:adminrole, false)
   redirect_to :action => :admin_users
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
