class AddSlugToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :slug, :string
  end
end
