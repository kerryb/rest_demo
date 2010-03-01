require 'spec_helper'

describe Product do
  it {should have_db_column(:code).of_type(:string)}
  it {should have_db_column(:description).of_type(:string)}
  it {should have_db_column(:price).of_type(:decimal)}
end
