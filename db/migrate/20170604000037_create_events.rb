class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :start
      t.string :end

      t.timestamps
    end
  end
end
