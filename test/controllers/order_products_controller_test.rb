require "test_helper"

class OrderProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get order_products_destroy_url
    assert_response :success
  end
end
