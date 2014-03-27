require 'test_helper'

class Rapidfire::RolesControllerTest < ActionController::TestCase
  setup do
    @rapidfire_role = rapidfire_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rapidfire_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rapidfire_role" do
    assert_difference('Rapidfire::Role.count') do
      post :create, rapidfire_role: { name: @rapidfire_role.name }
    end

    assert_redirected_to rapidfire_role_path(assigns(:rapidfire_role))
  end

  test "should show rapidfire_role" do
    get :show, id: @rapidfire_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rapidfire_role
    assert_response :success
  end

  test "should update rapidfire_role" do
    patch :update, id: @rapidfire_role, rapidfire_role: { name: @rapidfire_role.name }
    assert_redirected_to rapidfire_role_path(assigns(:rapidfire_role))
  end

  test "should destroy rapidfire_role" do
    assert_difference('Rapidfire::Role.count', -1) do
      delete :destroy, id: @rapidfire_role
    end

    assert_redirected_to rapidfire_roles_path
  end
end
