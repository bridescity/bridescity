class CreateRegistries < ActiveRecord::Migration
	def self.up
		create_table :registries do |t|
			t.string :name
			t.integer :city_id
		end
	end

	def self.down
		drop_table :registries
	end
end
