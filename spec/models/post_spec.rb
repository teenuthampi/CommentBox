require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "Associations" do
    it { should have_many(:comments) }
  end
  
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
  end
end