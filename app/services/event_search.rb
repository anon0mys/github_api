class EventSearch < GithubApiSearch
  def find_events
    raw_events = api_call('events')
    events = raw_events.map do |event|
      Event.new(event)
    end
    date_sort(events)
  end

  private
    def date_sort(repos)
      repos.sort_by do |repo|
        repo.created_at
      end.reverse
    end
end
