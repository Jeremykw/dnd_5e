class Wizard < Character
	has_one :character, as: :klass
end