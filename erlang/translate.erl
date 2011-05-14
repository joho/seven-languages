-export(translate).
-module([loop/0]).

loop() ->
  receive
    "casa" ->
      io:format("house~n"),
      loop();

    "blanca" ->
      io:format("white~n"),
      loop();

    _ ->
      io:format("I don't understant.~n"),
      loop();
end.

