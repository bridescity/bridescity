class CreateVendorProfiles < ActiveRecord::Migration
	def self.up
		create_table :vendor_profiles do |t|
			t.string :name
			t.integer :user_id
			t.timestamps
		end
	end

	def self.down
		drop_table :vendor_profiles
	end
end
