# Ruby HTML

An HTML document builder in Ruby.

### Installation

Add this line to your application's Gemfile:

```ruby
gem "ruby_html"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_html

### How to Use It

HTML elements have the names you think they would. For example, to create a div:

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

`Document` has a special method, `#render_to_file` that receives a file path, and creates your html document there.

```
Document.new.render_to_file("hello_world.html")
=> creates html document
```


### TODO

- Build out remaining elements. There are a few that conflict with ruby (such as `Object`).
- Code clean up (alphabetical order, some methods probably don't need to be public, etc).
- The single quotes for attributes are a bit weird, and you might not always want those.
- It desperately needs some tests!

### Contributing

1. Fork it
2. Clone it
3. Make a PR.
4. Be kind to others. Programming is fun.
