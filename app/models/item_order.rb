class ItemOrder 
  include ActiveModel::Model
   attr_accessor :post_code,:token,:prefecture_id,:city,:address,:building,:phone_number,:item_id,:user_id
  with_options presence: true do
    validates :token
    validates :post_code,format:{ with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id,numericality:{other_than:1}
    validates :city
    validates :address
    validates :phone_number,format:{with: /\A\d{11}\z/}
    validates :item_id
    validates :user_id
  end

  def save
     order = Order.create(item_id:item_id, user_id: user_id)
     Delevery.create(post_code:post_code,prefecture_id:prefecture_id,city:city,address:address,building:building,phone_number:phone_number,order_id: order.id)
  end
end
