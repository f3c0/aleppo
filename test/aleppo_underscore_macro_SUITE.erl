-module(aleppo_underscore_macro_SUITE).

-include_lib("common_test/include/ct.hrl").

-export([all/0]).
-export([parse_underscore_macro/1]).

-type config() :: [{atom(), term()}].

-spec all() -> [parse_underscore_macro].
all() -> [parse_underscore_macro].

-spec parse_underscore_macro(config()) -> {comment, []}.
parse_underscore_macro(Config) ->
  DataDir = ?config(data_dir, Config),
  Path = filename:join(DataDir, "underscore_macro.erl"),
  {ok, Tokens} = aleppo:process_file(Path),

  ct:pal("Tokens: ~p", [Tokens]),

  Tokens = [{'-', 1},
    {atom, 1, file},
    {'(', 1},
    {string, 1, Path},
    {',', 1},
    {integer, 1, 1},
    {')', 1},
    {dot, 1},
    {'-', [{location, {1, 1}}, {text, "-"}, {location, {1, 1}}]},
    {atom, [{location, {1, 2}}, {text, "module"}, {location, {1, 2}}], module},
    {'(', [{location, {1, 8}}, {text, "("}, {location, {1, 8}}]},
    {atom, [{location, {1, 9}}, {text, "underscore_macro"}, {location, {1, 9}}],
      underscore_macro},
    {')', [{location, {1, 25}}, {text, ")"}, {location, {1, 25}}]},
    {dot, [{location, {1, 26}}, {text, ".\n"}, {location, {1, 26}}]},
    {'-', [{location, {5, 1}}, {text, "-"}, {location, {5, 1}}]},
    {atom, [{location, {5, 2}}, {text, "export"}, {location, {5, 2}}], export},
    {'(', [{location, {5, 8}}, {text, "("}, {location, {5, 8}}]},
    {'[', [{location, {5, 9}}, {text, "["}, {location, {5, 9}}]},
    {atom, [{location, {5, 10}},
      {text, "use_macro_with_underscore"},
      {location, {5, 10}}],
      use_macro_with_underscore},
    {'/', [{location, {5, 35}}, {text, "/"}, {location, {5, 35}}]},
    {integer, [{location, {5, 36}}, {text, "0"}, {location, {5, 36}}], 0},
    {']', [{location, {5, 37}}, {text, "]"}, {location, {5, 37}}]},
    {')', [{location, {5, 38}}, {text, ")"}, {location, {5, 38}}]},
    {dot, [{location, {5, 39}}, {text, ".\n"}, {location, {5, 39}}]},
    {atom, [{location, {7, 1}},
      {text, "use_macro_with_underscore"},
      {location, {7, 1}}],
      use_macro_with_underscore},
    {'(', [{location, {7, 26}}, {text, "("}, {location, {7, 26}}]},
    {')', [{location, {7, 27}}, {text, ")"}, {location, {7, 27}}]},
    {'->', [{location, {7, 29}}, {text, "->"}, {location, {7, 29}}]},
    {'(', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {'fun', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {'(', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {var, [{location, {3, 20}}, {text, "X"}, {location, {3, 20}}], 'X'},
    {')', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {'->', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {'{', [{location, {3, 24}}, {text, "{"}, {location, {3, 24}}]},
    {var, [{location, {3, 25}}, {text, "X"}, {location, {3, 25}}], 'X'},
    {'}', [{location, {3, 26}}, {text, "}"}, {location, {3, 26}}]},
    {'end', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {')', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {'(', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {atom, [{location, {8, 15}}, {text, "aaa"}, {location, {8, 15}}], aaa},
    {')', [{location, {8, 4}}, {text, "_macroTest"}, {location, {8, 4}}]},
    {dot, [{location, {8, 19}}, {text, ".\n"}, {location, {8, 19}}]},
    {eof, 0}],

  {comment, []}.
