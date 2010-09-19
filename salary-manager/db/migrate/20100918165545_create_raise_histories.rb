class CreateRaiseHistories < ActiveRecord::Migration
  def self.up
    create_table :raise_histories do |t|
      t.float :request_amount
      t.boolean :is_approved

      t.timestamps
    end
  end

  def self.down
    drop_table :raise_histories
  end
end
