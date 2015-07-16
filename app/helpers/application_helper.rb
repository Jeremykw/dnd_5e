module ApplicationHelper

  # Generates a link to items/show wtih item name
  def item_name_to_link(item, character) 
    # item[:character_id] = character.id if character
    render_haml(link_to "#{item[:name]}", belonging_path(item))
  end
  
  private
  
  def render_haml(code)
    engine = Haml::Engine.new(code)
    engine.render
  end

end
