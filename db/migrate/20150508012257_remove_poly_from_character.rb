class RemovePolyFromCharacter < ActiveRecord::Migration
  def change
    remove_column :characters, :klass_id, :integer
    remove_column :characters, :klass_type, :string
    add_column :characters, :type, :string
  end
end
