class Item < ActiveRecord::Base
  belongs_to :supplier,
  class_name: 'Customer'
end
