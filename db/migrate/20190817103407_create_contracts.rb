class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :name, null: false
      t.string :number
      t.string :description
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :job

      # references
      t.references :contract_status
      t.references :user_group
      t.references :company
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
