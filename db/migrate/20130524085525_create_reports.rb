class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.string :status
      t.belongs_to :user, index: true
      t.integer :created_by
      t.string :created_ip
      t.integer :updated_by
      t.string :updated_ip

      t.timestamps
    end
  end
end
