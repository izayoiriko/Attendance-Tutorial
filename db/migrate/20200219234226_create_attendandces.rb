class CreateAttendandces < ActiveRecord::Migration[5.1]
  def change
    create_table :attendandces do |t|
      t.date :worked_on
      t.datetime :started_at
      t.datetime :finished_at
      t.string :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
