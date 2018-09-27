class Customer < ActiveRecord::Base
  enum cat: { customer:0, provider:1 }, _prefix: :cat
  has_many :invoices
  has_many :tractors
  has_many :machineries
end
