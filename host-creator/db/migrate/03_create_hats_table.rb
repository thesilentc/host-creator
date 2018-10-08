class CreateHatsTable < ActiveRecord::Migration
    def change
      create_table :hats do |t|
        t.text :hat_color
        t.integer :host_id
      end
    end
end
