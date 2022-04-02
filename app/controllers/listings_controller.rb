class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = params[:search].downcase
      @listingMatch = Listing.where("lower(title) LIKE ?", "%#{@parameter}%")
    end
  end

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

  def update
    if current_user==@listing.user or current_user.admin?
      respond_to do |format|
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

  def destroy
    @listing.destroy

    redirect_to listings_url, notice: "#{@listing.title} was deleted."
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:title, :price, :description, :user_id, :picture)
    end

    def check_owner
      if !current_user.admin? or !current_user.id==@listing.user_id
        redirect_to listings_url, alert: "You are not the owner of this listing!"
      end
    end
end
