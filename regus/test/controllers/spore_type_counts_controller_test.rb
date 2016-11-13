require 'test_helper'

class SporeTypeCountsControllerTest < ActionController::TestCase
  setup do
    @spore_type_count = spore_type_counts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spore_type_counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spore_type_count" do
    assert_difference('SporeTypeCount.count') do
      post :create, spore_type_count: { agrocybe: @spore_type_count.agrocybe, alternaria: @spore_type_count.alternaria, ascospores: @spore_type_count.ascospores, aspergillus: @spore_type_count.aspergillus, aureobasidium: @spore_type_count.aureobasidium, basidiospores: @spore_type_count.basidiospores, bipolaris: @spore_type_count.bipolaris, botrytis: @spore_type_count.botrytis, cercospora: @spore_type_count.cercospora, chaetomium: @spore_type_count.chaetomium, cladosporium: @spore_type_count.cladosporium, curvularia: @spore_type_count.curvularia, epicoccum: @spore_type_count.epicoccum, fibrous: @spore_type_count.fibrous, fusarium: @spore_type_count.fusarium, hyphal: @spore_type_count.hyphal, insect: @spore_type_count.insect, myxomycetes: @spore_type_count.myxomycetes, nigrospora: @spore_type_count.nigrospora, oidium: @spore_type_count.oidium, pithomyces: @spore_type_count.pithomyces, pithomyces: @spore_type_count.pithomyces, pollen: @spore_type_count.pollen, rust: @spore_type_count.rust, spegazzina: @spore_type_count.spegazzina, stachybotrys: @spore_type_count.stachybotrys, tape_bulk_coc_sample_id: @spore_type_count.tape_bulk_coc_sample_id, tetraploa: @spore_type_count.tetraploa, torula: @spore_type_count.torula, ulocladium: @spore_type_count.ulocladium, unidentifiable: @spore_type_count.unidentifiable }
    end

    assert_redirected_to spore_type_count_path(assigns(:spore_type_count))
  end

  test "should show spore_type_count" do
    get :show, id: @spore_type_count
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spore_type_count
    assert_response :success
  end

  test "should update spore_type_count" do
    patch :update, id: @spore_type_count, spore_type_count: { agrocybe: @spore_type_count.agrocybe, alternaria: @spore_type_count.alternaria, ascospores: @spore_type_count.ascospores, aspergillus: @spore_type_count.aspergillus, aureobasidium: @spore_type_count.aureobasidium, basidiospores: @spore_type_count.basidiospores, bipolaris: @spore_type_count.bipolaris, botrytis: @spore_type_count.botrytis, cercospora: @spore_type_count.cercospora, chaetomium: @spore_type_count.chaetomium, cladosporium: @spore_type_count.cladosporium, curvularia: @spore_type_count.curvularia, epicoccum: @spore_type_count.epicoccum, fibrous: @spore_type_count.fibrous, fusarium: @spore_type_count.fusarium, hyphal: @spore_type_count.hyphal, insect: @spore_type_count.insect, myxomycetes: @spore_type_count.myxomycetes, nigrospora: @spore_type_count.nigrospora, oidium: @spore_type_count.oidium, pithomyces: @spore_type_count.pithomyces, pithomyces: @spore_type_count.pithomyces, pollen: @spore_type_count.pollen, rust: @spore_type_count.rust, spegazzina: @spore_type_count.spegazzina, stachybotrys: @spore_type_count.stachybotrys, tape_bulk_coc_sample_id: @spore_type_count.tape_bulk_coc_sample_id, tetraploa: @spore_type_count.tetraploa, torula: @spore_type_count.torula, ulocladium: @spore_type_count.ulocladium, unidentifiable: @spore_type_count.unidentifiable }
    assert_redirected_to spore_type_count_path(assigns(:spore_type_count))
  end

  test "should destroy spore_type_count" do
    assert_difference('SporeTypeCount.count', -1) do
      delete :destroy, id: @spore_type_count
    end

    assert_redirected_to spore_type_counts_path
  end
end
