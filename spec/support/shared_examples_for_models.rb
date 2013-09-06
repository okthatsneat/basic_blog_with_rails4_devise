shared_examples_for "a model that validates presence of" do |property, model_name|
  it "requires a value for #{property}" do
    record = FactoryGirl.build(:"#{model_name}")
    record.send(:"#{property}=", nil)
    record.should_not be_valid
    record.errors[property.to_sym].should include("can't be blank")
  end
end