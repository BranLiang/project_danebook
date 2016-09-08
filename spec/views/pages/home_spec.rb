require 'rails_helper'

describe 'pages/home.html.erb' do
  it "shows the welcome words" do
    render
    expect(rendered).to match('<h1>Hello, world!</h1>')
  end
end
