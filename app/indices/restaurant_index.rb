ThinkingSphinx::Index.define :restaurant,  :with => :active_record do
  indexes :name
  indexes :address
end
