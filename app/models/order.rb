class Order < ActiveRecord::Base
  has_many :order_lines

  def self.create_from_xml xml
    logger.debug "XML: #{xml}"
    order_data = Hash.from_xml xml rescue return(nil)
    logger.debug "Parsed XML: #{order_data.inspect}"
    order = create!
    lines = order_data.try(:[], "order").try(:[], "line")
    if lines
      lines = [lines] unless lines.instance_of?(Array)
      lines.each do |line|
        quantity = line["quantity"]
        product_id = line["product"].split("/").last # FIXME: EVIL!
        logger.debug "Creating order line for #{quantity} x Product #{product_id}"
        OrderLine.create! :order => order, :product_id => product_id, :quantity => quantity
      end
    end
    order
  end
end
