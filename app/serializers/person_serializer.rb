class PersonSerializer < ActiveModel::Serializer
  cache key: 'person', expires_in: 1.day
  attributes :nameFirst, :nameLast, :bats, :throws, :debut, :height, :weight
  has_many :battings
end
