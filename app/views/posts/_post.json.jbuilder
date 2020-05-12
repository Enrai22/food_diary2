json.extract! post, :id, :title, :content, :image, :category, :user_id, :rate_deli, :rate_acc, :rate_rep, :rate_cost, :created_at, :updated_at
json.url post_url(post, format: :json)
