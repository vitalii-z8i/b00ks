ThinkingSphinx::Index.define :book, with: :active_record do
  indexes name
  indexes author
  indexes description
end