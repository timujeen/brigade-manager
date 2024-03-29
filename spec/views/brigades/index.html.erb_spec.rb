require 'spec_helper'

describe "brigades/index" do
  before(:each) do
    assign(:brigades, [
      stub_model(Brigade,
        :title => "Title",
        :count_of_workers => 1,
        :price => "9.99",
        :country_id => 2
      ),
      stub_model(Brigade,
        :title => "Title",
        :count_of_workers => 1,
        :price => "9.99",
        :country_id => 2
      )
    ])
  end

  it "renders a list of brigades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
