
require 'spec_helper'

RSpec.describe Surfio::Path do

  let(:path)           { Surfio::Path.new(path: "a.b") }
  

  describe ':path' do


    it 'works' do
      expect(path.path).to eq 'a.b'
    end
  end

  describe 'keys' do

    it 'works' do
      expect(path.keys).to eq ['a', 'b']
    end
  end

  describe 'size' do

    it 'works' do
      expect(path.size).to eq 2
    end
  end
end