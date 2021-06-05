mix phx.gen.html Posts Post posts title:string body:text

mix ecto.create
mix ecto.migrate

mix phx.gen.schema Comment comments name:string content:text post_id:references:posts