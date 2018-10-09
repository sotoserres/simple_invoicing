class Tractor < ActiveRecord::Base
  belongs_to :owner,
  class_name: 'Customer',
  foreign_key: :user_id
end
