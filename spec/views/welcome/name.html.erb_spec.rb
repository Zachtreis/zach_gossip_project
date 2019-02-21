require 'rails_helper'

RSpec.describe "welcome/name.html.erb", type: :view do
  context 'display all the gossips created with info on its authors, comments and likes' do  
    it 'should display gossips' do
      assign(:gossip, content: "mon gossip est trop cool !")
      render
      expect(rendered).to match 'mon gossip est trop cool !'
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
