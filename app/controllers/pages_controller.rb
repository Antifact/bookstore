class PagesController < ApplicationController
  def home
    @listings = Listing.order("created_at desc").limit(3)
  end
end
