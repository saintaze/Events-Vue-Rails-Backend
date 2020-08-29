class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :start
      t.string :end
      t.string :backgroundColor
      t.string :borderColor
      t.boolean :allDay

      t.timestamps
    end
  end
end
