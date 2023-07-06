class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :summary
      t.belongs_to :robot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
