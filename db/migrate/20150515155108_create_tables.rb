class CreateTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)
      t.column(:venue_id, :int)
      t.timestamps
    end

    create_table(:venues) do |t|
      t.column(:name, :string)
      t.column(:band_id, :int)
      t.timestamps
    end

    create_table(:bands_venues) do |t|
      t.column(:band_id, :int)
      t.column(:venue_id, :int)
      t.timestamps
    end
  end
end
