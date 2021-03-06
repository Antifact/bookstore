require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      title: "MyString",
      price: 1.5,
      description: "MyString",
      user: nil
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[user_id]"
    end
  end
end
