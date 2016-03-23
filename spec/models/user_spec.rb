require 'rails_helper'

RSpec.describe User, type: :model do
 


  context "filled in user" do 
  	let(:user){build(:user)}

  	it 'checks if user is over 18' do 
  		user.birthday = "2001-08-11 14:55:43" 
  		expect(user.valid?).to eq(false)
  	end
  

  
  	
  	it "user name should be present" do
  		user.name = ""
  		expect(user.valid?).to eq(false)
 	 end

 	 it "should have a format MM-DD-YYYY birthday" do
 	 	
 	 	expect(user.get_pretty_birthday).to eq("03-23-1985")
 	 end

 	 it "should have full name" do 
 	 	user.name = "joeblow"
 	 	expect(user.valid?).to eq(false) 
 	 end

 	 it "password should be at least 8 characters" do 
 	 	user.password = "stop"
 	 	expect(user.valid?).to eq(false)

 	 end
	
	end



end
