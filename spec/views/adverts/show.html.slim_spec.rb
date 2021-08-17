require 'rails_helper'

RSpec.describe "adverts/show", type: :view do
  before(:each) do
    @advert = assign(:advert, Advert.create!(
      title: "Title",
      description: "MyText",
      image: "Image",
      status: "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Status/)
  end
end
