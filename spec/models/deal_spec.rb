require 'rails_helper'

RSpec.describe Deal, type: :model do
    subject! { described_class.create({ percent: 100, value: 1000 })}
    let!(:first_deal) { subject }
    let!(:second_deal) { Deal.create({ percent: 100, value: 2000 })}
    let!(:third_deal) { Deal.create({ percent: 100, value: 3000 })}
    let!(:fourth_deal) { Deal.create({ percent: 25, value: 2000 })}

    it 'has two attributes' do
        expect(subject.percent).to eq(100)
        expect(subject.value).to eq(1000)
    end

    it 'its value is groupped by percent' do
        expect(Deal.group_by_stage[100]).to eq(6000) 
    end

    it 'should have four records' do
        expect(Deal.count).to eq(4)
    end

end