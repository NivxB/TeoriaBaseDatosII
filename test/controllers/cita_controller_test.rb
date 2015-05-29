require 'test_helper'

class CitaControllerTest < ActionController::TestCase
  setup do
    @citum = cita(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cita)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create citum" do
    assert_difference('Citum.count') do
      post :create, citum: { Estado: @citum.Estado, FechaEstimadaEntrega: @citum.FechaEstimadaEntrega, FechaHoraEntrada: @citum.FechaHoraEntrada, NombreCliente: @citum.NombreCliente, Placa: @citum.Placa, TelefonoContacto: @citum.TelefonoContacto }
    end

    assert_redirected_to citum_path(assigns(:citum))
  end

  test "should show citum" do
    get :show, id: @citum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @citum
    assert_response :success
  end

  test "should update citum" do
    patch :update, id: @citum, citum: { Estado: @citum.Estado, FechaEstimadaEntrega: @citum.FechaEstimadaEntrega, FechaHoraEntrada: @citum.FechaHoraEntrada, NombreCliente: @citum.NombreCliente, Placa: @citum.Placa, TelefonoContacto: @citum.TelefonoContacto }
    assert_redirected_to citum_path(assigns(:citum))
  end

  test "should destroy citum" do
    assert_difference('Citum.count', -1) do
      delete :destroy, id: @citum
    end

    assert_redirected_to cita_path
  end
end
