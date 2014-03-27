class RemoveProjectInfoFromEmp < ActiveRecord::Migration
  def change
    remove_column :emp, :projects, :string
    remove_column :emp, :project_begin_date, :datetime
    remove_column :emp, :project_due_date, :datetime
  end
end
