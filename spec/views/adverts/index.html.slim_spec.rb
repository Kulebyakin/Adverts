require 'rails_helper'

RSpec.describe "adverts/index", type: :view do
  before(:each) do
    assign(:adverts, [
      Advert.create!(
        title: "Title",
        description: "MyText",
        image: "Image",
        status: "Status"
      ),
      Advert.create!(
        title: "Title",
        description: "MyText",
        image: "Image",
        status: "Status"
      )
    ])
  end

  it "renders a list of adverts" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Image".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
  end
end
