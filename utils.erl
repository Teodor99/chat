-module(utils).
-author("Teodor").

%% API
-export([set_cookie/0, list_contains/2]).

%% @doc
%% requires you to start erlang with `erl -sname node_name`  
%% @end
set_cookie() -> erlang:set_cookie(node(), default).

-spec(list_contains(Element :: term(), List :: [term()]) -> boolean()).
list_contains(Element, List) -> lists:any(fun(E) -> (E =:= Element) end, List).