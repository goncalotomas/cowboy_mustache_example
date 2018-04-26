# Cowboy server demo using mustache templates


Uses [bbmustache][1]. Listens on a single route (`/:name`), where `name` is passed into the template.  

To keep things simple and stateless, the template is being read on each request. Ideally, you'd probably start a gen_server, read all templates and keep them in the server state.

## Why?

There are no practical examples in the Cowboy documentation or source code that demonstrate how one could use templates.

## Build and Play

    # use this command and then navigate to http://localhost:8080/clica.ai
    $ rebar3 shell

## Possible Enhancements

- Allow for reloading templates, manually or listening to file changes in the template directory (hot reloading)
- Read all templates from directory and index them by name, and allow other modules to get a template by name

[1]: https://github.com/soranoba/bbmustache
