class AddUserToSalary < ActiveRecord::Migration
  def self.up
    change_table :salaries do |t|
      t.references :user
    end
  end

  def self.down
    change_table :salaries do |t|
      t.remove :user
    end
  end
end
