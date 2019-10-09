# frozen_string_literal: true

require 'spec_helper'

RSpec.describe VCard do
  subject(:card) { described_class.new(attributes) }

  let(:attributes) do
    {
      'name' => 'John Doe da Silva',
      'first_name' => 'FirstName',
      'last_name' => 'LastName',
      'note' => 'the-note'
    }
  end

  it 'has #note' do
    expect(card.note).to eq('the-note')
  end

  describe '#first_name' do
    context 'when given' do
      it 'returns the first name' do
        expect(card.first_name).to eq('FirstName')
      end
    end

    context 'when absent' do
      before do
        attributes['first_name'] = nil
      end

      it 'takes the first name from name' do
        expect(card.first_name).to eq('John')
      end
    end
  end

  describe '#last_name' do
    context 'when given' do
      it 'returns the last name' do
        expect(card.last_name).to eq('LastName')
      end
    end

    context 'when absent' do
      before do
        attributes['last_name'] = nil
      end

      it 'takes the last name from name' do
        expect(card.last_name).to eq('Doe da Silva')
      end
    end
  end
end
