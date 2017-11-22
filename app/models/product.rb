class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    acts_as_list
    belongs_to :category, optional: true
    def publish!
    self.is_hidden = false
    self.save
  end
  def hide!
    self.is_hidden = true
    self.save
  end

    scope :published, -> { where(is_hidden: false) }
    scope :recent, -> { order('created_at DESC') }
    scope :random3, -> { limit(3).order('RANDOM()') }
end
