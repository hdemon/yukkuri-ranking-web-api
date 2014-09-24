class JsonStrategy
  def initialize
    @strategy = FactoryGirl.strategy_by_name(:build).new
  end

  delegate :association, to: :@strategy

  def result(evaluation)
    hash = @strategy.result(evaluation).as_json
    hash.delete("id")
    hash.delete("created_at")
    hash.delete("updated_at")
    hash
  end
end
