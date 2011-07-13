class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :summary
      t.text :content
      t.string :status
      t.datetime :begin_at
      t.references :user
      t.text :trace

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
