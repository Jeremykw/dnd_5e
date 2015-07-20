module ApplicationHelper
	# Item fields not to be show in tabel format in show
	def a_field_not_to_be_show
		[ "updated_at", "created_at", "pack", "id", "action", "controller", "details", "character_id"]
	end
	
  
  private
  
  def render_haml(code)
    engine = Haml::Engine.new(code)
    engine.render
  end

end
