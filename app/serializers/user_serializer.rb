class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :username, :phone_number, :address, :profile_picture
end
