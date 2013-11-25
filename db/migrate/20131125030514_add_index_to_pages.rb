class AddIndexToPages < ActiveRecord::Migration
  def change
    add_index :pages, :user_id
    add_index :pages, :wiki_id
  end
end
