require 'spec_helper'

describe OrderLine do
  it {should have_db_column(:quantity).of_type(:integer)}
  it {should belong_to(:order)}
  it {should belong_to(:product)}
end
