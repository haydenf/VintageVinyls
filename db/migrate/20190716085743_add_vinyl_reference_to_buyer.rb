class AddVinylReferenceToBuyer < ActiveRecord::Migration[5.2]
  def change
    add_reference :buyers, :vinyl, foreign_key: true
  end
end
