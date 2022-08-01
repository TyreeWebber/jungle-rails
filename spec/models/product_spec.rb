require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should not let products be created without names' do
      @category = Category.new
      @product = Product.new(name: nil, price_cents: 28888, quantity: 15, category: @category)
      expect(@product).to be_invalid
    end
    it 'should not let products be created without prices' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price_cents: nil, quantity: 15, category: @category)
      expect(@product).to be_invalid
    end
    it 'should not let a products be created without quantities' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price_cents: 28888, quantity: nil, category: @category)
      expect(@product).to be_invalid
    end
    it 'should not let a products be created without categories' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price_cents: 28888, quantity: 15, category: nil)
      expect(@product).to be_invalid
    end
    it 'should create new products when all required fields are valid' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price_cents: 28888, quantity: 15, category: @category)
      expect(@product).to be_valid
    end
  end
end