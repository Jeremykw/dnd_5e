class FixSkillsColumnName < ActiveRecord::Migration
  def change
  	rename_column :skills, :Athletics, :athletics
  	rename_column :skills, :Decept, :decept
  	rename_column :skills, :survial, :survival
  end
end
