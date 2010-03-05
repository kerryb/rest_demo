class Order < ActiveRecord::Base
  def self.create_from_xml xml
    order = Hash.from_xml xml rescue return(nil)
    create
  end
end
