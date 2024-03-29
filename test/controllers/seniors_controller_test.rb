require "test_helper"

class SeniorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @senior = seniors(:one)
  end

  test "should get index" do
    get seniors_url
    assert_response :success
  end

  test "should get new" do
    get new_senior_url
    assert_response :success
  end

  test "should create senior" do
    assert_difference("Senior.count") do
      post seniors_url, params: { senior: { age: @senior.age, code: @senior.code, gender: @senior.gender, pseudo: @senior.pseudo, structure_id: @senior.structure_id } }
    end

    assert_redirected_to senior_url(Senior.last)
  end

  test "should show senior" do
    get senior_url(@senior)
    assert_response :success
  end

  test "should get edit" do
    get edit_senior_url(@senior)
    assert_response :success
  end

  test "should update senior" do
    patch senior_url(@senior), params: { senior: { age: @senior.age, code: @senior.code, gender: @senior.gender, pseudo: @senior.pseudo, structure_id: @senior.structure_id } }
    assert_redirected_to senior_url(@senior)
  end

  test "should destroy senior" do
    assert_difference("Senior.count", -1) do
      delete senior_url(@senior)
    end

    assert_redirected_to seniors_url
  end
end
