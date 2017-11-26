require 'test_helper'

class PostingSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posting_source = posting_sources(:one)
  end

  test "should get index" do
    get posting_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_posting_source_url
    assert_response :success
  end

  test "should create posting_source" do
    assert_difference('PostingSource.count') do
      post posting_sources_url, params: { posting_source: { description: @posting_source.description, name: @posting_source.name, purchase_quantity: @posting_source.purchase_quantity, quantity_type: @posting_source.quantity_type, valid_to: @posting_source.valid_to } }
    end

    assert_redirected_to posting_source_url(PostingSource.last)
  end

  test "should show posting_source" do
    get posting_source_url(@posting_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_posting_source_url(@posting_source)
    assert_response :success
  end

  test "should update posting_source" do
    patch posting_source_url(@posting_source), params: { posting_source: { description: @posting_source.description, name: @posting_source.name, purchase_quantity: @posting_source.purchase_quantity, quantity_type: @posting_source.quantity_type, valid_to: @posting_source.valid_to } }
    assert_redirected_to posting_source_url(@posting_source)
  end

  test "should destroy posting_source" do
    assert_difference('PostingSource.count', -1) do
      delete posting_source_url(@posting_source)
    end

    assert_redirected_to posting_sources_url
  end
end
