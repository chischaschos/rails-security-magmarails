class AddRoleToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.references :role
    end    
  end

  def self.down
    change_table :users do |t|
      t.remove :role_id
    end
  end
end
