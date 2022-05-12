class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :note
      t.creator :belongs_to
      t.updater :belongs_to
      t.string :classification

      t.timestamps
    end
  end
end
