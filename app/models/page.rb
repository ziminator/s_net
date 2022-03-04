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
class Page < ApplicationRecord
  after_create :clean_url

  validates_presence_of :title, :body
  validates :title, length: { in: 3..20 }
  validates :body, length: { in: 3..100_00 }

  private

  def clean_url
    return unless self.permalink.nil?
    url = title.downcase.gsub(/\s+/, '_').gsub(/[^a-zA-Z0-9_]+/, '')
    self.permalink = url
    save
  end
end
