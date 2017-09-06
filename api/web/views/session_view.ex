defmodule Api.SessionView do
  use Api.Web, :view

  def render("show.json", %{user: user, jwt: jwt}) do
    %{
      data: render_one(user, Api.UserView, "user.json"),
      meta: %{token: jwt}
    }
  end

  def render("error.json", _) do
    %{error: "Invalid email or password"}
  end

  def render("delete.json", _) do
    %{ok: true}
  end

  def render("forbidden.json", %{error: error}) do
    %{error: error}
  end
end