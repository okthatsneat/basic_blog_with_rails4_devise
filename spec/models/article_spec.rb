require 'spec_helper'

describe Article do 

  it "should create a new instance given valid attributes" do
    @article = FactoryGirl.create(:article)
  end

  it_behaves_like "a model that validates presence of", :title, :article
  it_behaves_like "a model that validates presence of", :body, :article

  it "should have one user" do
    should belong_to(:user)
  end


end