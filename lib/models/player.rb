class Player

  include DataMapper::Resource

  property :id,        Serial
  property :username,  String, :unique => true
  property :available, Boolean, :default => false

  has n, :posts

end
