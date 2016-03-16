defmodule RodgomesOrg.Router do
  use Plug.Router
  require EEx

  plug Plug.Static,  at: "/public", from: :rodgomes_org
  plug Plug.Static,  at: "/", from: :rodgomes_org, only: ~w(favicon.ico robots.txt)
  plug Plug.Logger
  plug :match
  plug :dispatch

  EEx.function_from_file :defp, :template_index, "templates/index.html.eex", [:analytics_code]

  get "/" do

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, template_index(Application.get_env(:rodgomes_org, :analytics_code)))
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
