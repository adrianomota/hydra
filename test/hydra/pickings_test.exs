defmodule Hydra.PickingTest do
  use Hydra.DataCase

  alias Hydra.{Pickings, Pickings.Core.SendProductToKafka}

  import Mock

  describe "create_picking/1" do
    test "should create pickings" do
      products = %{
        products: [
          %{product: "product_01", stores: ["store_01", "store_02"]},
          %{product: "product_02", stores: ["store_03", "store_04"]}
        ]
      }

      with_mock(SendProductToKafka,
        execute: fn _products -> {:ok, {:brod_call_ref, 123, 123, "abc"}} end
      ) do
        assert Pickings.create_picking(products) == {:ok, {:brod_call_ref, 123, 123, "abc"}}
      end
    end
  end
end
