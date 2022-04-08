class PagesController < ApplicationController

  # Show the most recent listings on the homepage, newest to oldest, but only limit to 3 listings 
  def home
    @listings = Listing.order("created_at desc").limit(3)
  end
end
