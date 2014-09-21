json.array!(@mylists) do |mylist|
  json.extract! mylist, :id, :title, :mylist_id, :description
  json.url mylist_url(mylist, format: :json)
end
