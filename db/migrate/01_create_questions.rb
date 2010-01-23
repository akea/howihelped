class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.text :benefit
      t.integer :user_id
      t.timestamps
#     ---------------
#     geo data:
#     ---------------
      t.string :country_name
      t.string :country_code
      t.string :country_code3
      t.string :city
      t.string :region
      t.string :postal_code
      t.decimal :latitude, :precision => 15, :scale => 10
      t.decimal :longitude,:precision => 15, :scale => 10
#     ---------------
      t.boolean :approved
      t.string :akismet
      t.string :user_agent
      t.string :user_ip
      t.string :referrer
    end
  end
  
  def self.down
    drop_table :questions
  end
end
