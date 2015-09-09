class ApplicationSerializer < ActiveModel::Serializer
  def self.optional_attribute(key, check, serializer)
    attribute key, serializer: serializer
    define_method(key) do
      return nil unless object.send(check)
      serializer.new(object).attributes
    end
  end
end