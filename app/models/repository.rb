class Repository
  attr_reader :name,
              :language, 
              :updated_at, 
              :forks_count, 
              :description, 
              :stargazers_count

  def initialize(attrs)
    @name = attrs[:name]
    @language = attrs[:language]
    @updated_at = DateTime.parse(attrs[:updated_at])
    @stargazers_count = attrs[:stargazers_count]
    @forks_count = attrs[:forks_count]
    @description = attrs[:description]
  end
end
