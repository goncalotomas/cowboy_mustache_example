-module(cowboy_mustache_example_handler).

-export([init/2]).

-define(APP, cowboy_mustache_example).
-define(TEMPLATE_PATH, code:priv_dir(?APP) ++ "/hello.mustache").

init(Req0, Opts) ->
    Name = cowboy_req:binding(name, Req0, "World"),
    {ok, Template} = file:read_file(?TEMPLATE_PATH),
    Output = bbmustache:render(Template, #{"name" => Name}),
	Req = cowboy_req:reply(200, #{
		<<"content-type">> => <<"text/html">>
	}, Output, Req0),
    {ok, Req, Opts}.
