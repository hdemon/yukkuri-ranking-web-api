class Mylists
  include ActiveModel::Model
  attr_accessor :items
  attr_accessor :posted_params
  attr_accessor :errors

  def initialize(params_array)
    @errors = []
    @posted_params = params_array
    @items = params_array.map do |params|
      Mylist.new(params)
    end
  end

  def save
    result = @items.map do |mylist|
      if mylist.save
        true
      else
        e = { mylist_id: mylist.mylist_id, errors: mylist.errors.messages }
        @errors.push e
        false
      end
    end

    result.all?
  end
end
