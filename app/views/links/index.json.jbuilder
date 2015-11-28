json.array!(@links) do |link|
  json.extract! link, :id, :url, :description, :weighting, :cluster_id
  json.url link_url(link, format: :json)
end
