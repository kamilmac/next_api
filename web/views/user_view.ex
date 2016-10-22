defmodule NextApi.UserView do
  use NextApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, NextApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, NextApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      username: user.username,
      password_hash: user.password_hash}
  end
end
