json.array!(@incomes) do |income|
  json.extract! income, :id, :date, :sum, :income_id
  json.url income_url(income, format: :json)
end
