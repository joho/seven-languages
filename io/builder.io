

// start creating our builder object
Builder := Object clone

Builder depth := 0

Builder forward := method(
  // build the indentation (hacky as)
  padding := ""
  for(i, 0, depth - 1,
    padding = padding .. "  "
  )
  
  // open the tag
  // writeln(padding, tag(call message))
  
  depth = depth + 1 // increase indentation

  // keep going down the tree
  attributes := ""
  inner_xml := list()
  call message arguments foreach(
    arg,
    content := self doMessage(arg)
    if(content type == "Sequence", inner_xml append(content))
    if(content type == "Map",
      content keys foreach(key,
        attributes := " #{key}=\"#{content at(key)}" interpolate
      )
    )
  )

  writeln(padding, "<", call message name, attributes, ">")
  inner_xml foreach(inner_element,
    writeln(padding .. "  " .. inner_element)
  )
  
  // close the tag
  writeln(padding, "</", call message name, ">")
  depth = depth - 1 // pull the indentation back in
)



// lets try out this awesome syntax
Builder html(
  head(
    title("Prototype based languages")
  ),
  body(
    h1("Prototype languages"),
    script(Map clone atPut("lah", "ninja")),
    p(Map clone atPut("class", "rad_p_class"),
      "We all love prototype languages, here are 3"
    ),
    ul(
      li("Io"),
      li("Lua"),
      li("Javascript")
    )
  )
)
