json.array!(@charges) do |charge|
  json.extract! charge, :id, :subject, :document_id, :client_id
  json.url charge_url(charge, format: :json)
end
