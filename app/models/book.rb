class Book < ApplicationRecord
# モデルのファイル設定

 validates :title, presence: true
 validates :body, presence: true

end

