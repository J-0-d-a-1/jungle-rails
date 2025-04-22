require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should save successfully with all validations' do
      @category = Category.new(name: 'Flower')
      @product = Product.new(name: 'Sakura', price: 10000, quantity: 100, category: @category)

      @product.save!

      expect(@product.id).to be_present
    end

    it 'should get error message when name is nil' do
      @category = Category.new(name: 'Flower')
      @product = Product.new(name: nil, price: 10000, quantity: 100, category: @category) 

      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should get error message when price is nil' do
      @category = Category.create(name: 'Flower')
      @product = Product.new(name: 'Sakura', quantity: 100, category: @category) 

      @product.valid?

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should get error message when quantity is nil' do
      @category = Category.new(name: 'Flower')
      @product = Product.new(name: 'Sakura', price: 10000, quantity: nil, category: @category) 

      @product.valid?

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should get error message when category is nil' do
      @category = nil
      @product = Product.new(name: 'Sakura', price: 10000, quantity: 100, category: @category) 

      @product.valid?

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
