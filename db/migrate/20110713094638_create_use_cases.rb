class CreateUseCases < ActiveRecord::Migration
  def self.up
    create_table :use_cases do |t|
      t.string :title
      t.text :description
      t.references :user
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :use_cases
  end
end
