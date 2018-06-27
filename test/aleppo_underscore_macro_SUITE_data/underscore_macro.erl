-module(underscore_macro).

-define(_macroTest(X), {X}).

-export([use_macro_with_underscore/0]).

use_macro_with_underscore() ->
  ?_macroTest(aaa).
