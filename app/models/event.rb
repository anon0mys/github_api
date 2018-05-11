class Event
  attr_reader :type, :repo, :created_at

  def initialize(attrs)
    @type = attrs[:type]
    @repo = attrs[:repo][:name]
    @created_at = DateTime.parse(attrs[:created_at])
  end
end
