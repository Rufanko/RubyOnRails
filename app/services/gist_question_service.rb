class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      "description": "A question about #{@test.title} from TestGuru",
      "files": {
        "test-guru-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    content  = [@question.content]
    content += @question.answers.pluck(:content)
    content.join("\n")
  end

  private

  def default_client
    Octokit::Client.new(access_token: Rails.application.credentials.gist_github_api_access_token!)
  end
end
