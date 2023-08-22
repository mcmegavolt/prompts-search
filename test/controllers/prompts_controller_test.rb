require "test_helper"

class PromptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prompt = prompts(:one)

    Prompt.__elasticsearch__.import force: true
    Prompt.__elasticsearch__.refresh_index!
  end


  test "should get index" do
    get prompts_url
    assert_response :success
  end

  test "should get search results" do
    get search_prompts_url(q: "MyText")
    assert_response :success
    assert_not_nil assigns(:prompts)
    assert_equal 2, assigns(:prompts).size
  end


  test "should get new" do
    get new_prompt_url
    assert_response :success
  end

  test "should create prompt" do
    assert_difference("Prompt.count") do
      post prompts_url, params: { prompt: { body: @prompt.body } }
    end

    assert_redirected_to prompt_url(Prompt.last)
  end

  test "should show prompt" do
    get prompt_url(@prompt)
    assert_response :success
  end

  test "should get edit" do
    get edit_prompt_url(@prompt)
    assert_response :success
  end

  test "should update prompt" do
    patch prompt_url(@prompt), params: { prompt: { body: @prompt.body } }
    assert_redirected_to prompt_url(@prompt)
  end

  test "should destroy prompt" do
    assert_difference("Prompt.count", -1) do
      delete prompt_url(@prompt)
    end

    assert_redirected_to prompts_url
  end
end
