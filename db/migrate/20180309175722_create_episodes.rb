class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :audio_url
      t.timestamp :published_date
    end
  end
end
