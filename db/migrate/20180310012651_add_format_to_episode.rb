class AddFormatToEpisode < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :audio_format, :string
  end
end
