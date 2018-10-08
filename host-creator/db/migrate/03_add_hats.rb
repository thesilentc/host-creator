class AddHats < ActiveRecord::Migration
    def change
      create_table :hats do |t|
        t.text :hat
        t.integer :host_id
      end
    end
end
