class CreateAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :agreements do |t|
      t.text :message
      t.string :detail
      t.datetime :date
      t.references :user, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
