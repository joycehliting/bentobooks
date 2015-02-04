class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
