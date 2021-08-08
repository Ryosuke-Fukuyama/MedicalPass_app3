module ApplicationHelper
  def write_data(data)
    content_tag('script', data.to_json.html_safe, id: 'server_side_data', type: 'application/json')
  end
end
