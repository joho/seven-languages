Builder := Object clone
Builder depth := 0

Builder forward := method(
  // build the indentation (hacky as)
  padding := ""
  for(i, 0, depth - 1,
    padding = padding .. "  "
  )
  
  // open the tag
  writeln(padding, "<", call message name, ">")
  
  depth = depth + 1 // increase indentation

  // keep going down the tree
  call message arguments foreach(
    arg,
    content := self doMessage(arg)
    if(content type == "Sequence", writeln(padding .. "  ", content))
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
    p("We all love prototype languages, here are 3"),
    ul(
      li("Io"),
      li("Lua"),
      li("Javascript")
    )
  )
)
