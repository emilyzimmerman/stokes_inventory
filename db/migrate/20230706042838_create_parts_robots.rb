class CreatePartsRobots < ActiveRecord::Migration[7.0]
  def change
    create_table :parts_robots do |t|
      t.belongs_to :part, null:false, foreign_key: true 
      t.belongs_to :robot, null:false, foreign_key: true 
      t.timestamps
    end
  end
end
