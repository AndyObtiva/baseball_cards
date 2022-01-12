class AddImageUrlToBaseballCards < ActiveRecord::Migration[7.0]
  def change
    add_column :baseball_cards, :image_url, :string
  end
end
