require 'rails_helper'

RSpec.describe "adverts/new", type: :view do
  before(:each) do
    assign(:advert, Advert.new(
      title: "MyString",
      description: "MyText",
      image: "MyString",
      status: "MyString"
    ))
  end

  it "renders new advert form" do
    render

    assert_select "form[action=?][method=?]", adverts_path, "post" do

      assert_select "input[name=?]", "advert[title]"

      assert_select "textarea[name=?]", "advert[description]"

      assert_select "input[name=?]", "advert[image]"

      assert_select "input[name=?]", "advert[status]"
    end
  end
end
