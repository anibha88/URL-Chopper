json.array!(@choppies) do |choppy|
  json.extract! choppy, :id, :shortened_url, :actual_url, :http_status
  json.url choppy_url(choppy, format: :json)
end
