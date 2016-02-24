json.array!(@pages) do |page|
  json.extract! page, :id, :text, :url_yt, :id_project
  json.url page_url(page, format: :json)
end
