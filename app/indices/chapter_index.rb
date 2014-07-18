ThinkingSphinx::Index.define :chapter, with: :active_record do
  indexes inner_text, sortable: true
end