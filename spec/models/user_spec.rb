require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:restaurant_reviews) }

    it { should have_many(:hotel_reviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
