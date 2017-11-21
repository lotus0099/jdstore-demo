class CategoryGroup < ApplicationRecord
    validates :name, presence: true
    has_many :categories

    mount_uploader :image, GroupUploader
    def publish!
        self.is_hidden = false
        self.save
    end
    def hide!
        self.is_hidden = true
        self.save
    end
    # 上傳類型 Logo 圖 #
  mount_uploader :logo, ImageUploader

  # Scope #
  scope :published, -> { where(is_hidden: false) }
end
