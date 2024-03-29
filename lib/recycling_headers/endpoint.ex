defmodule RecyclingHeaders.Endpoint do
  use Phoenix.Endpoint, otp_app: :recycling_headers

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :recycling_headers, gzip: false,
    only: ~w(css images js favicon.ico robots.txt)

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_recycling_headers_key",
    signing_salt: "GWyPwVGZ"

  plug :router, RecyclingHeaders.Router
end
