class CreateWebsiteConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :website_configurations do |t|
      t.string :site_intro

      t.timestamps
    end
  end
end
