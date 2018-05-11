
require 'spec_helper'

RSpec.describe Surfio::Target do

  let(:target)           { Surfio::Target.new(path: Surfio::Path.new(path:'a.b'), default: nil) }
  
  describe 'basic target' do

    it 'works' do
      expect(target.path.path).to eq 'a.b'
      expect(target.default).to be_nil
 
    end
  end

  describe 'basic hash' do

    context 'when keys exists' do
      let(:hash) { {'a'=> { 'b' => 3 }} }

      it 'works' do
        expect(target.get(hash)).to eq 3
      end
    end

    context 'when keys exists' do
      let(:hash) { {'a'=> { 'b' => { 'c' => 4 } }} }

      it 'works' do
        expect(target.get(hash)).to eq({ 'c' => 4 })
      end

      context 'new path' do
        before do
          target.path.path = 'a.b.c'
        end

        it 'works' do
          expect(target.get(hash)).to eq 4 
        end
      end
    end

    context 'when second keys does not exist' do
      let(:hash) { {'a'=> {}} }

      it 'works' do
        expect(target.get(hash)).to be_nil
      end
    end

    context 'when first key does not exist' do
      let(:hash) { {'c'=> {}} }
      
      it 'works' do
        expect(target.get(hash)).to be_nil
      end

      it 'returns default' do
        target.default = 'default'
        expect(target.get(hash)).to eq 'default'
      end

    end

    
  end


end 