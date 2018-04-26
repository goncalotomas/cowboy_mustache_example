%%%-------------------------------------------------------------------
%% @doc cowboy_mustache_example public API
%% @end
%%%-------------------------------------------------------------------

-module(cowboy_mustache_example_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/:name", cowboy_mustache_example_handler, []}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
        env => #{dispatch => Dispatch}
    }),
    cowboy_mustache_example_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
