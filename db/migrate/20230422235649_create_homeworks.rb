class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|
      t.string :title
      t.belongs_to :teacher, null: false

      t.timestamps
    end
  end
end
