require 'spec_helper'

RSpec.describe Nusii::Utils::JsonApiBuilder do
  let(:id) { 164 }
  let(:currency) { "EUR" }

  let(:data) do
    {
      "id" => id,
      "type" => "sections",
      "attributes" => {
        "currency" => currency,
        "account_id" => 3,
        "title" => "A section"
      }
    }
  end

  let(:extra) { nil }

  subject { described_class.new data, extra }

  describe '#call' do
    context 'no relationships' do
      it 'return the right object' do
        result = subject.call

        expect(result).to be_a Nusii::Section
        expect(result.id).to eq id
        expect(result.currency).to eq currency
      end
    end

    context 'has relationships but not included' do
      let(:line_item_id) { "76" }

      let(:data) do
        {
          "id" => id,
          "type" => "sections",
          "attributes" => {
            "currency" => currency,
            "account_id" => 3,
            "title" => "A section"
          },
          "relationships" => {
            "line_items" => {
                "data" => [
                  {
                    "id" => line_item_id,
                    "type" => "line_items"
                  }
                ]
            }
          }
        }
      end

      it 'return the right object with its relationships' do
        result = subject.call

        expect(result).to be_a Nusii::Section
        expect(result.id).to eq id
        expect(result.currency).to eq currency

        expect(result.line_items).not_to be_empty

        line_item = result.line_items.first
        expect(line_item.id).to eq line_item_id.to_i
        expect(line_item.name).to be_nil
      end
    end

    context 'has relationships with included data' do
      let(:line_item_id) { "76" }
      let(:line_item_name) { "A line item" }

      let(:data) do
        {
          "id" => id,
          "type" => "sections",
          "attributes" => {
            "currency" => currency,
            "account_id" => 3,
            "title" => "A section"
          },
          "relationships" => {
            "line_items" => {
                "data" => [
                  {
                    "id" => line_item_id,
                    "type" => "line_items"
                  }
                ]
            }
          }
        }
      end

      let(:extra) do
        [
          {
            "id" => line_item_id,
            "type" => "line_items",
            "attributes" => {
              "section_id" => 164,
              "name" => line_item_name,
            }
          }
        ]
      end

      it 'return the right object with its relationships' do
        result = subject.call

        expect(result).to be_a Nusii::Section
        expect(result.id).to eq id
        expect(result.currency).to eq currency

        expect(result.line_items).not_to be_empty

        line_item = result.line_items.first
        expect(line_item.id).to eq line_item_id.to_i
        expect(line_item.name).to eq line_item_name
      end
    end
  end


end
