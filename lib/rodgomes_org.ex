defmodule RodgomesOrg.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "hey from index page!")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

end
