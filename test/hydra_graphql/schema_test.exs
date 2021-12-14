defmodule HydraGraphql.SchemaTest do
  use HydraWeb.ConnCase

  test "mutation: create picking", %{conn: conn} do
    conn =
      post(conn, "/graphql", %{
        "query" => """
          mutation {
            createPicking(products: [
              {
                product: "product_01",
                stores: ["store_01", "store_02"]
              },
              {
                product: "product_02",
                stores: ["store_03", "store_04"]
              }
            ])
          }
        """,
        "variables" => %{}
      })

    assert json_response(conn, 200) == %{
             "data" => %{
               "createPicking" =>
                 "We received the payload, and we are going to create all orders!"
             }
           }
  end
end
