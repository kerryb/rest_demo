class Order < ActiveRecord::Base
  has_many :order_lines

  def self.create_from_xml xml
    order_data = Hash.from_xml xml rescue return(nil)
    order = create
    order_data["order"]["line"].each do |line|
      OrderLine.create :order => order, :quantity => line["quantity"],
        :product_id => line["product"].split("/").last # FIXME: EVIL!
    end
    order
  end
end
