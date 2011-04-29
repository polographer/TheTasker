class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :task_type
      t.string :name
      t.datetime :runat
      t.string :server
      t.string :login
      t.string :password
      t.text :sql
      t.text :fields
      t.text :files
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
