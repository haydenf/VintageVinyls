class AddBuyerReferenceToVinyl < ActiveRecord::Migration[5.2]
  def change
    add_reference :vinyls, :buyer, foreign_key: true
  end
end
