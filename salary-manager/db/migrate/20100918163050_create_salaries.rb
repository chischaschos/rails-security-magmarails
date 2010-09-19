class CreateSalaries < ActiveRecord::Migration
  def self.up
    create_table :salaries do |t|
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :salaries
  end
end
