class Universities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.text :desc
      t.string :city
      t.string :state
      t.decimal :zip
      t.string :name
      t.string :collegeType
      t.decimal :rank
      t.decimal :acceptanceRate
      t.decimal :enrollment
      t.decimal :arrTuition
      t.timestamps
    end  

  end
end
