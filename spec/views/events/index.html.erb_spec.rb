require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :address => "MyText",
        :latitude => 2.5,
        :longitude => 3.5,
        :admin_id => "Admin",
        :prev_year_event_id => 4,
        :belongs_to => "",
        :has_many => ""
      ),
      Event.create!(
        :title => "Title",
        :address => "MyText",
        :latitude => 2.5,
        :longitude => 3.5,
        :admin_id => "Admin",
        :prev_year_event_id => 4,
        :belongs_to => "",
        :has_many => ""
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Admin".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
