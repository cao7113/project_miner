require 'test_helper'

class UseCasesControllerTest < ActionController::TestCase
  setup do
    @use_case = use_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:use_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create use_case" do
    assert_difference('UseCase.count') do
      post :create, :use_case => @use_case.attributes
    end

    assert_redirected_to use_case_path(assigns(:use_case))
  end

  test "should show use_case" do
    get :show, :id => @use_case.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @use_case.to_param
    assert_response :success
  end

  test "should update use_case" do
    put :update, :id => @use_case.to_param, :use_case => @use_case.attributes
    assert_redirected_to use_case_path(assigns(:use_case))
  end

  test "should destroy use_case" do
    assert_difference('UseCase.count', -1) do
      delete :destroy, :id => @use_case.to_param
    end

    assert_redirected_to use_cases_path
  end
end
