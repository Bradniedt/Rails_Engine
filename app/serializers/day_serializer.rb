class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at
end
