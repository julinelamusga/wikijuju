class AddPremiumToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :premium, :boolean, default: false
  end
end
