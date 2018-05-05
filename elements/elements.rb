%w(Div P H1 H2 H3 H4 H5 H6 Img Script Style Title).each do |klass_name|
  klass = Class.new(Element)
  Object.const_set(klass_name, klass)
end
