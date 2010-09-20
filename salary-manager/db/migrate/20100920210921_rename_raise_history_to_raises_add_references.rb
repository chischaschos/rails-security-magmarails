class RenameRaiseHistoryToRaisesAddReferences < ActiveRecord::Migration
  def self.up
    drop_table :raise_histories
    create_table :raises do |t|
      t.float :request_amount
      t.boolean :is_approved
      t.references :user
      t.integer :approver_id

      t.timestamps
    end
  end

  def self.down
    create_table :raise_histories do |t|
      t.float :request_amount
      t.boolean :is_approved

      t.timestamps
    end
  end
end
