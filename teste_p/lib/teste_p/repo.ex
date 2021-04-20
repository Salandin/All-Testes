defmodule TesteP.Repo do
  use Ecto.Repo,
    otp_app: :teste_p,
    adapter: Ecto.Adapters.Postgres
end
