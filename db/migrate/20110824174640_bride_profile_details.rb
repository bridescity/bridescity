class BrideProfileDetails < ActiveRecord::Migration
	def self.up
		change_table :bride_profiles do |t|
			t.column :wedding_date, :date
			t.column :about_wedding, :text
			t.column :city_id, :integer
			t.column :registry_id, :integer
		end
	end

	def self.down
		change_table :bride_profiles do |t|
			t.remove :wedding_date
			t.remove :about_wedding
			t.remove :city_id
			t.remove :registry_id
		end
	end
end