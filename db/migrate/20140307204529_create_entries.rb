class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :author
      t.text :note
      t.date :date
      t.timestamps
    end
  end
end
