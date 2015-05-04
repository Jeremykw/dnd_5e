class AddCharacterIdToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :klass_id, :integer
    add_column :characters, :klass_type, :string
    remove_column :characters, :type, :string
  end
end
