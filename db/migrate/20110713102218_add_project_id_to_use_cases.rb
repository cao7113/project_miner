class AddProjectIdToUseCases < ActiveRecord::Migration
  def self.up
    add_column :use_cases, :project_id, :integer
  end

  def self.down
    remove_column :use_cases, :project_id
  end
end
