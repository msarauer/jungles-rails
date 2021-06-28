require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should save product successfully with 4 categories' do
      @category = Category.new
      @category.id = 5

      @product = Product.new
      @product.name = "Mithcel"
      @product.price = 9999
      @product.quantity = 10


      @category.products = [@product]

      @product.save
      expect(@product).to be_valid
    end

    it 'should not be valid without a name' do
      @category = Category.new
      @category.id = 5
      @product = Product.new
      @product.name = nil
      @product.price = 9999
      @product.quantity = 10


      @category.products = [@product]

      @product.save
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
      expect(@product).to_not be_valid
    end

    it 'should not be valid without a price' do
      @category = Category.create({name: 'category1'})
      
      @product = Product.new({name: 'hello', quantity: 4, category: @category})

      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
      expect(@product).to_not be_valid
    end

    it 'should not be valid without a quantity' do
      @category = Category.new
      @category.id = 5
      @product = Product.new
      @product.name = "Mitchel"
      @product.price = 1
      @product.quantity = nil


      @category.products = [@product]

      @product.save
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
      expect(@product).to_not be_valid
    end

    it 'should not be valid without a Category' do
      @product = Product.new
      @product.name = "Mitchel"
      @product.price = 1
      @product.quantity = 10


      

      @product.save

      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
      expect(@product).to_not be_valid
    end
  end
end
