class AddPriceCentsToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :price_cents, :integer
  end
end
