class CreateEventToUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_to_users do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
