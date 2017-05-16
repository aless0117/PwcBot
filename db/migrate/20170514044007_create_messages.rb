class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :telegram_id
      t.string :first_name
      t.string :last_name
      t.string :text
      t.timestamps
    end
  end
end
