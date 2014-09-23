class Mylist < ActiveRecord::Base
  validates :title, presence: true
  validates :mylist_id, uniqueness: true
end
