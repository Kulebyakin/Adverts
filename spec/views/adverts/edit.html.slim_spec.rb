require 'rails_helper'

RSpec.describe "adverts/edit", type: :view do
  before(:each) do
    @advert = assign(:advert, Advert.create!(
      title: "MyString",
      description: "MyText",
      image: "MyString",
      status: "MyString"
    ))
  end

  it "renders the edit advert form" do
    render

    assert_select "form[action=?][method=?]", advert_path(@advert), "post" do

      assert_select "input[name=?]", "advert[title]"

      assert_select "textarea[name=?]", "advert[description]"

      assert_select "input[name=?]", "advert[image]"

      assert_select "input[name=?]", "advert[status]"
    end
  end
end
