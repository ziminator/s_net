class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title,      null: false
      t.string :permalink
      t.text :body,         null: false

      t.timestamps
    end
  end
end