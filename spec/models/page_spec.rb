# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  permalink  :string
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Page, type: :model do
  describe '.create' do
    context 'with valid attributes' do
      include_examples 'creates_object_for', :page
    end

    context 'with invalid attributes' do
      context 'with short title' do
        include_examples 'not_create_object_for', :page, title: 'te'
      end

      context 'with long title' do
        include_examples 'not_create_object_for', :page, title: Faker::String.random(length: 253)
      end

      context 'with short body' do
        include_examples 'not_create_object_for', :page, body: 'te'
      end

      context 'with long body' do
        include_examples 'not_create_object_for', :page, body: Faker::String.random(length: 100_02)
      end
    end

    context 'with missing attributes' do
      context 'with missing title' do
        include_examples 'not_create_object_for', :page, title: nil
      end

      context 'with missing body' do
        include_examples 'not_create_object_for', :page, body: nil
      end
    end
  end
end