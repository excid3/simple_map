module ApplicationHelper
  def tag_links(tags)
    tags.sort{|a,b|a.name <=> b.name}.collect {|t| link_to t.name, tagged_businesses_path(t.name)}.join(", ").html_safe
  end
end
