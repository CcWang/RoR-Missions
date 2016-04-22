class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.references :user, index: true
      t.string :title
      t.integer :interval
      t.integer :times
      t.date :when_start_date
      t.time :when_start_time
      t.integer :lasting
      t.boolean :night_mode
      t.integer :check_count
      t.integer :alert_count
      t.boolean :status

      t.timestamps
    end
  end
end
