class AddProjectsAndDivisionTables < ActiveRecord::Migration
  def change
    create_table :project do |t|
      t.column :name, :string
      t.column :project_description, :string
      t.column :project_start_date, :datetime
      t.column :project_end_date, :datetime

      t.timestamps
    end
    create_table :div do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end

