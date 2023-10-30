class FirstDestination < ApplicationRecord
  belongs_to :user
  # Geocoderの設定
  geocoded_by :address # 住所情報を使用して緯度と経度を取得
  after_validation :geocode # バリデーション後に緯度と経度を取得
end
