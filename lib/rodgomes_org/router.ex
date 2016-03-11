defmodule RodgomesOrg.Router do
  use Plug.Router
  require EEx

  plug Plug.Logger
  plug :match
  plug :dispatch

  plug Plug.Static,
          at: "/public",
          from: :rodgomes_org,
          only: ~w(static) ++ [prefix: "prefix"]


  EEx.function_from_file :defp, :template_index, "templates/index.html.eex"

  get "/" do

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, template_index())
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
