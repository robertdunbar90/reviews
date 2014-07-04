class Item < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews
end
