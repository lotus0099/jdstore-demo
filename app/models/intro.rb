class Intro < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    

    mount_uploader :image, IntroUploader
    scope :published, -> { where(is_hidden: false) }
    # 發佈 / 隱藏 #
    def publish!
        self.is_hidden = false
        save
    end

    def hide!
        self.is_hidden = true
        save
    end
end
