class CreateAddBuyerReferenceToVinyls < ActiveRecord::Migration[5.2]
  def change
    create_table :add_buyer_reference_to_vinyls do |t|
      t.references :vinyl, foreign_key: true

      t.timestamps
    end
  end
end
