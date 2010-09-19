class AddSiteToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :site
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :site
    end
  end
end
