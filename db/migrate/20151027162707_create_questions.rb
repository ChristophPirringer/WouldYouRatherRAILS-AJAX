class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :firstOption, :string
      t.column :secondOption, :string
      t.column :firstCount, :integer, :default => 0
      t.column :secondCount, :integer, :default => 0

      t.timestamps
    end
  end
end
