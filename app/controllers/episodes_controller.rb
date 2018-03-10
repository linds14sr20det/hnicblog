class EpisodesController < ApplicationController
  before_action :logged_in_user, only: [:update_feed]

  def index
    @episodes = Episode.order(:published_date => :desc).paginate(page: params[:page], :per_page => 12)
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def update_feed
    require 'rss'
    require 'open-uri'
    rss = RSS::Parser.parse(open('https://hobbynight.podbean.com/feed/').read, false)
    rss.items.each do |result|
      binding.pry
      episode = Episode.find_or_create_by(title: result.title)
      episode.update(description: result.description, published_date: result.pubDate, url: result.link, audio_url: result.enclosure.url, audio_format: '')
    end
    redirect_to action: "index"
  end
end