class CreateHostsTable < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.text :content
      t.integer :user_id
      t.string :hat
    end
  end
end
