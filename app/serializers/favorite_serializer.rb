class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :if, :first_name, :last_name
end
