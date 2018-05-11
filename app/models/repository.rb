class Repository
  attr_reader :name, :language, :updated_at, :forks_count, :description

  def initialize(attrs)
    @name = attrs[:name]
    @language = attrs[:language]
    @updated_at = DateTime.parse(attrs[:updated_at])
    @forks_count = attrs[:forks_count]
    @description = attrs[:description]
  end
end
