require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :title => "MyString",
      :address => "MyText",
      :latitude => 1.5,
      :longitude => 1.5,
      :admin_id => "MyString",
      :prev_year_event_id => 1,
      :belongs_to => "",
      :has_many => ""
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "textarea#event_address[name=?]", "event[address]"

      assert_select "input#event_latitude[name=?]", "event[latitude]"

      assert_select "input#event_longitude[name=?]", "event[longitude]"

      assert_select "input#event_admin_id[name=?]", "event[admin_id]"

      assert_select "input#event_prev_year_event_id[name=?]", "event[prev_year_event_id]"

      assert_select "input#event_belongs_to[name=?]", "event[belongs_to]"

      assert_select "input#event_has_many[name=?]", "event[has_many]"
    end
  end
end
