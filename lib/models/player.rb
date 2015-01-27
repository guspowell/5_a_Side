class Player

  include DataMapper::Resource

  property :id,        Serial
  property :username,  String :unique => true

end
