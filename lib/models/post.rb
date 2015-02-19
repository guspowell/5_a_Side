class Post

  include DataMapper::Resource

  property :id,         Serial
  property :content,    Text
  property :created_at, DateTime

  belongs_to :player

end