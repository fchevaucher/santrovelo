class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :fee
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
