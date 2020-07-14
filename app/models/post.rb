class Post < ActiveRecord::Base
 validates :title, presence: true
 validates :content, length: { minimum: 250 }
 validates :summary, length: {maximum: 250}
 validates :category, inclusion: { in: ["Fiction",  "Non-Fiction"] }
 validates :clickbait-y, presence: {"Won't Believe", "Secret", "Top [number]", "Guess"}
end


# eate_table "posts", force: :cascade do |t|
#   t.string   "title"
#   t.text     "content"
#   t.text     "summary"
#   t.string   "category"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
