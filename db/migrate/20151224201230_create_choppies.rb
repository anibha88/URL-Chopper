class CreateChoppies < ActiveRecord::Migration
  def change
    create_table :choppies do |t|
      t.string :shortened_url
      t.text :actual_url
      t.integer :http_status

      t.timestamps null: false
    end
  end
end
