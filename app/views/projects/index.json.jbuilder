json.array!(@projects) do |project|
  json.extract! project, :id, :name, :project_type_id, :status_id
  json.url project_url(project, format: :json)
end
