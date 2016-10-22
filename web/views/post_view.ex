defmodule NextApi.PostView do
  use NextApi.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, NextApi.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, NextApi.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      name: post.name,
      color: post.color,
      size: post.size}
  end
end
