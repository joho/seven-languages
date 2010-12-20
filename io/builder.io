

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
  writeln(padding, tag(call message))
  
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

Builder tag := method(m,
  tag_string := "<" .. m name
  first_arg_content := self doMessage(m arguments at(0))
  if(first_arg_content type == Map type,
    first_arg_content keys foreach(key,
      tag_string := tag_string .. " " .. key .. "=\"" .. first_arg_content at(key) .. "\""
    )
  )
  tag_string := tag_string .. ">"
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
