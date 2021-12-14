defmodule HydraGraphql.Resolvers.PickingResolver do
  def create_picking(_parent, _params, _resolution) do
    # %{
    #   products: [
    #     %{product: "product_01", stores: ["store_01", "store_02"]},
    #     %{product: "product_02", stores: ["store_03", "store_04"]}
    #   ]
    # }

    {:ok, "We received the payload, and we are going to create all orders!"}
  end
end
