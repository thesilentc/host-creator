class CreateHostsTable < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :hat
      t.text :content
      t.integer :user_id
    end
  end
end
