# rHTML

A (totally unnecessary) HTML document builder in Ruby.

### Installation 

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
These elements will be nested under their parent.

```
div = Div.new("Hello", P.new("World"))
```

You can also add new elements to a previously created element with `#add_elements`, which accepts any number of arguments.

```
div.add_elements("Hello")
div.add_elements("Hello", "From", H3.new("Earth"))
```

You can pass the same element as an argument as many times as you want - just like a partial or component.

All elements have a method `#render`, which prints all the element's contents (calling `.render` on all non string elements
contained within.

```
div = Div.new(H6.new("Hello"), "World")
div.render
=> "<div><h6>Hello</h6>World</div>"
```

To add attributes to an element, pass a hash to the object like so:

```
p_with_class = P.new("Hello World", attributes: { "class": "red" })
p_with_class.render
=> <p class='red'>Hello World</p>
```

Most importantly, if you want to actually create an HTML page, you'll want to create a `Document` that holds all of your elements.
A document recieves elements, as well as header elements (such as `<title>` or `<style>`). 

```
title = Title.new("Page Title")
Document.new(Div.new, header_elements: [title])
```

`Document` has a special method, `#render_to_file` that recieves a file path, and creates your html document there.

```
Document.new.render_to_file("hello_world.html")
=> creates html document
```


### TODO

So much!

- Build out all other elements. See the current list of supported elements [here](https://github.com/JonathanWThom/rhtml/blob/master/elements/elements.rb).
- Tests! 
- Gemify it.

### Contributing

1. Fork it
2. Clone it
3. Make a PR. 
4. Be kind to others. Programming is fun.

### License

MIT 
