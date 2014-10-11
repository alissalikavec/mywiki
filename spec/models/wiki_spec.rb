require 'spec_helper'

RSpec.describe Wiki, :type => :model do
  
	context "Validates presense of title" do
		subject { Wiki.new(title: nil, content: 'aaa', user_id: 1) }
  	specify { expect(subject).not_to be_valid }
	end

	context "Validates presense of content" do
		subject { Wiki.new(title: "testing", content: nil, user_id: 1) }
  	specify { expect(subject).not_to be_valid }
	end

	context "Validates presense of user_id" do
		subject { Wiki.new(title: "testing", content: "aaa", user_id: nil) }
  	specify { expect(subject).not_to be_valid }
	end
end
