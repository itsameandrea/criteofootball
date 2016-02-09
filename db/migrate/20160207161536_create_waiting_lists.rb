class CreateWaitingLists < ActiveRecord::Migration
  def change
    create_table :waiting_lists do |t|
      
      t.integer :user_id

      t.timestamps
    end
    
    drop_table :waiting_lists
  end
end
