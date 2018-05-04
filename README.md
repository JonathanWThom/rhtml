# rHTML

A (totally unnecessary) HTML document builder in Ruby.

### Implentation

Eventually, this will be a gem, but for now you can do:

```
git clone https://github.com/jonathanwthom/rhtml.git
cd rhtml
irb
require_relative "rhtml"
```

Or you can include the rhtml directory in a project, and 
require it there.

### How to Use It

HTML element classes have the names you think they would. For example, to create a div:

```
div = Div.new
```

Elements can receive arguments. These can be strings, or can be other elements themselves.

```
div = Div.new("Hello", Div.new("World"))
```

You can also add new elements to a previously created element with `#add_elements`, which accepts any number of arguments.

```
div.add_elements("Hello")
div.add_elements("Hello", "From", Div.new("Earth"))
```

You can pass the same element as an argument as many times as you want - just like a partial or component.

All elements have a method `#render`, which prints all the element's contents (calling `.render` on all non string elements
contained within.

```
div = Div.new(Div.new("Hello"), "World")
div.render
=> "<div><div>Hello</div>World</div>"
```

Most importantly, if you want to actually create an HTML page, you'll want to create a `Document` that holds all of your elements.
`Document` has a special method, `#render_to_file` that recieves a file path, and creates your html document there.

```
Document.new(Div.new("Hello World")).render_to_file("hello_world.html")
=> creates html document
```


### TODO

So much!

- Build out all other elements.
- Ability to customize header in `Document` class.
- Each element + `Document` should have its own set of tests.
- Allow for HTML attributes with Ruby, not just by writing gross strings.
- Allow for adding CSS classes to elements, again, not just by writing gross strings.
- Gemify it.

### Contributing

1. Fork it
2. Clone it
3. Make a PR. 
4. Be kind to others. Programming is fun.

### License

MIT 
