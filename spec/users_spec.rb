require 'spec_helper'

describe Sendbird::User do

  describe "#create" do

  	let(:user) { Sendbird::User.new(id: "user_12345", nickname: "Etienne") }

  	context "valid api token" do
	    before(:each) do
	      VCR.use_cassette "user_create" do
	      	@created_user = user.create
	      end
	    end

	    it { expect(@created_user).to be_persisted }
	    it { expect(@created_user.user_id).to eq("4510356") }

  	end

  end

end