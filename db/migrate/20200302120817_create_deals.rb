class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.float :value
      t.integer :percent

      t.timestamps
    end
  end
end
