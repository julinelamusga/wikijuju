class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :wiki_id
      t.integer :user_id

      t.timestamps
    end
  end
end
