# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Template do
  subject(:template) { described_class.new(vcard) }

  let(:vcard) { instance_double(VCard, attributes) }
  let(:content) { template.to_s }
  let(:lines) { content.split("\n") }
  let(:attributes) do
    {
      first_name: 'first name',
      last_name: 'last name',
      name: 'full-name',
      note: 'some note',
      revision: 'the-revision',
      formatted_phone: 'the-phone',
      uid: 'the-uid'
    }
  end

  describe '#to_s' do
    it 'renders beginnig of card' do
      expect(lines.first).to eq('BEGIN:VCARD')
      expect(lines[1]).to eq('VERSION:3.0')
      expect(lines.last).to eq('END:VCARD')
    end

    it 'renders name' do
      expect(content).to include('N:first name;last name;;;')
      expect(content).to include('FN:full-name')
    end

    it 'renders note' do
      expect(content).to include('NOTE:some note')
    end

    it 'renders revision' do
      expect(content).to include('the-revision')
    end

    describe '#phone' do
      context 'when present' do
        it 'is rendered' do
          expect(content).to include('TEL;type=CELL;type=VOICE;type=pref:the-phone')
        end
      end

      context 'when not present' do
        before do
          attributes[:formatted_phone] = ''
        end

        it 'is ommited' do
          expect(content).not_to include('TEL;')
        end
      end
    end

    describe '#uid' do
      context 'when present' do
        it 'is rendered' do
          expect(content).to include('UID:the-uid')
        end
      end

      context 'when not present' do
        before do
          attributes[:uid] = nil
        end

        it 'is ommited' do
          expect(content).not_to include('UID:')
        end
      end
    end
  end
end
