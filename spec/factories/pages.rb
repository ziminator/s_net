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
FactoryBot.define do
  factory :page do
    title { 'Test' }
    body { 'Test' }
  end
end
