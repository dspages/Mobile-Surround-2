class TracksReconfig < ActiveRecord::Migration[5.0]
  def change

    remove_column :tracks, :channel1, :binary
    remove_column :tracks, :channel2, :binary
    remove_column :tracks, :channel3, :binary
    remove_column :tracks, :channel4, :binary
    remove_column :tracks, :channel5, :binary
    add_column :tracks, :channel1, :string
    add_column :tracks, :channel2, :string
    add_column :tracks, :channel3, :string
    add_column :tracks, :channel4, :string
    add_column :tracks, :channel5, :string
  end
end
