class AddProjectToEmp < ActiveRecord::Migration
  def change
    add_column :emp, :projects, :string
    add_column :emp, :project_begin_date, :datetime
    add_column :emp, :project_due_date, :datetime
  end
end
