class CreateBaseballCards < ActiveRecord::Migration[7.0]
  def change
    create_table :baseball_cards do |t|
      t.string :name
      t.string :team
      t.string :position

      t.timestamps
    end
  end
end
