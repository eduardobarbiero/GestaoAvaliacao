require 'test_helper'

class ConhecimentosControllerTest < ActionController::TestCase
  setup do
    @conhecimento = conhecimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conhecimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conhecimento" do
    assert_difference('Conhecimento.count') do
      post :create, conhecimento: { maxima: @conhecimento.maxima, minima: @conhecimento.minima, nome: @conhecimento.nome }
    end

    assert_redirected_to conhecimento_path(assigns(:conhecimento))
  end

  test "should show conhecimento" do
    get :show, id: @conhecimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conhecimento
    assert_response :success
  end

  test "should update conhecimento" do
    patch :update, id: @conhecimento, conhecimento: { maxima: @conhecimento.maxima, minima: @conhecimento.minima, nome: @conhecimento.nome }
    assert_redirected_to conhecimento_path(assigns(:conhecimento))
  end

  test "should destroy conhecimento" do
    assert_difference('Conhecimento.count', -1) do
      delete :destroy, id: @conhecimento
    end

    assert_redirected_to conhecimentos_path
  end
end
