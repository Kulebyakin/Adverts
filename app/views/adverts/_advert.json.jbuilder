json.extract! advert, :id, :title, :description, :image, :status, :created_at, :updated_at
json.url advert_url(advert, format: :json)
