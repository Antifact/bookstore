class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]

  # ensure that if the user is logged in, only then they can create, edit, update or delete a listing. 
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # if the user is the owner of the listing, only then can they edit or delete the listing.
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  # individual listing page
  def show
  end

  # method for creating a new listing
  def new
    @listing = Listing.new
  end

  # method for editing a listing
  def edit
  end

  # search logic. if the search is empty, then redirect to homepage.
  # if the search has something entered, it will transform what was entered and make it lowercase. 
  # the search will take all listing titles and transform them into lowercase too, and try to match what the user entered with any titles.
  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = params[:search].downcase
      @listingMatch = Listing.where("lower(title) LIKE ?", "%#{@parameter}%")
    end
  end

  # this is the logic for creating a new listing. it must take the respected parameters, otherewise it will not be made.
  def create
    @listing = Listing.new(title: listing_params[:title], price: listing_params[:price], description: listing_params[:description], user_id: current_user.id, picture: listing_params[:picture])
    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        redirect_to listings_url, notice: "#{@listing.title} was not made"
      end
    end
  end

  # edit listing logic. if a user is the creator or admin, then they can update the listing. otherwise, they will be redirected to the homepage.
  def update
    if current_user==@listing.user or current_user.admin?
      respond_to do |format|
        # must take the parameters specified in listing_params
        if @listing.update(listing_params)
          format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
          format.json { render :show, status: :ok, location: @listing }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to index
    end
  end

  # method for deleting a listing
  def destroy
    @listing.destroy

    redirect_to listings_url, notice: "#{@listing.title} was deleted."
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # the parameters that MUST be given to make or update a listing
    def listing_params
      params.require(:listing).permit(:title, :price, :description, :user_id, :picture)
    end

    # the logic to check to make sure a user is either an administrator or the creator of a listing
    def check_owner
      if !current_user.admin? or !current_user.id==@listing.user_id
        redirect_to listings_url, alert: "You are not the owner of this listing!"
      end
    end
end
