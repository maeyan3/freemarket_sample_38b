class ItemImage < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :item_image_src, ItemImageUploader
end
