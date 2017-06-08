class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :telegram_id
      t.string :last_name
      t.string :first_name

      t.timestamps
    end
  end
end
