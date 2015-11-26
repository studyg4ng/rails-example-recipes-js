require 'test_helper'

class ContainsControllerTest < ActionController::TestCase
  setup do
    @contain = contains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contain" do
    assert_difference('Contain.count') do
      post :create, contain: { amount: @contain.amount, ingredient_id: @contain.ingredient_id, recipe_id: @contain.recipe_id, unit: @contain.unit }
    end

    assert_redirected_to contain_path(assigns(:contain))
  end

  test "should show contain" do
    get :show, id: @contain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contain
    assert_response :success
  end

  test "should update contain" do
    patch :update, id: @contain, contain: { amount: @contain.amount, ingredient_id: @contain.ingredient_id, recipe_id: @contain.recipe_id, unit: @contain.unit }
    assert_redirected_to contain_path(assigns(:contain))
  end

  test "should destroy contain" do
    assert_difference('Contain.count', -1) do
      delete :destroy, id: @contain
    end

    assert_redirected_to contains_path
  end
end
