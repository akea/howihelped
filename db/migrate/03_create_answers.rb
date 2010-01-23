class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :body
      t.integer :question_id
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
    drop_table :answers
  end
end
