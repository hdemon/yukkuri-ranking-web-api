class Mylist < ActiveRecord::Base
  validates :title, presence: true
  validates :mylist_id, uniqueness: true, numericality: :only_integer
end
