defmodule Hydra.Pickings.Core.SendProductToKafkaTest do
  use Hydra.DataCase
  alias Hydra.Pickings.Core.SendProductToKafka
  import Mock

  describe "execute/1" do
    test "should send products to kafka" do
      products = %{
        products: [
          %{product: "product_01", stores: ["store_01", "store_02"]},
          %{product: "product_02", stores: ["store_03", "store_04"]}
        ]
      }

      with_mock(:brod,
        start_client: fn _hosts, _client_id -> :ok end,
        start_producer: fn _client_id, _topic, _opts -> :ok end,
        produce: fn _client_id, _topic, _partition, _key, _payload ->
          {:ok, {:brod_call_ref, 123, 123, "abc"}}
        end
      ) do
        assert SendProductToKafka.execute(products) == {:ok, {:brod_call_ref, 123, 123, "abc"}}
      end
    end
  end
end
