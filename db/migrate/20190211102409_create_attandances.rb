class CreateAttandances < ActiveRecord::Migration[5.2]
  def change
    create_table :attandances do |t|
      t.string :stripe_customer_id
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
