class GithubModels
  def determine_if_empty(data)
    if data.blank?
      "No information provided"
    else
      data
    end
  end

  def parse_for_reading(data)
    DateTime.parse(data).strftime("%b %-d, %Y")
  end
end
