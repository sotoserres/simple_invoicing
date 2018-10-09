class Machinery < ActiveRecord::Base
  belongs_to :owner,
  class_name: 'Customer'
end
