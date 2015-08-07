require 'test_helper'

class RespostasControllerTest < ActionController::TestCase
  setup do
    @respostas = respostas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:respostas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create Respostas" do
    assert_difference('Respostas.count') do
      post :create, Respostas: { corpo: @respostas.corpo, titulo: @respostas.titulo }
    end

    assert_redirected_to resposta_path(assigns(:Respostas))
  end

  test "should show Respostas" do
    get :show, id: @respostas
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @respostas
    assert_response :success
  end

  test "should update Respostas" do
    patch :update, id: @respostas, Respostas: { corpo: @respostas.corpo, titulo: @respostas.titulo }
    assert_redirected_to resposta_path(assigns(:Respostas))
  end

  test "should destroy Respostas" do
    assert_difference('Respostas.count', -1) do
      delete :destroy, id: @respostas
    end

    assert_redirected_to respostas_index_path
  end
end
