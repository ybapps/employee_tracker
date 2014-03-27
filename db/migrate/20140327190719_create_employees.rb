class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :emp do |t|
      t.column :name, :string
      t.column :division, :string

      t.timestamps
    end
  end
end
