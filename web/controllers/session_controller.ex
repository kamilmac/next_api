defmodule NextApi.SessionController do
  use NextApi.Web, :controller
  alias NextApi.User

  def create(conn, %{"username" => username, "password" => password}) do
    case Repo.get_by(User, %{username: username}) do
      nil ->
        Comeonin.Bcrypt.dummy_checkpw
        login_failed(conn)
      user ->
        if Comeonin.Bcrypt.checkpw(password, user.password_hash) do
          {:ok, token, _} = Guardian.encode_and_sign(user, :api)
          render(conn, "token.json", %{token: token})
        else
          login_failed(conn)
        end
    end
  end
  
  defp login_failed(conn) do
    conn
    |> render("login_failed.json", %{})
    |> halt
  end
end