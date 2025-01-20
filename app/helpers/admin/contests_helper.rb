# frozen_string_literal: true

module Admin::ContestsHelper
  def contest_countdown_summary(contest)
    if contest.starts_at > Time.current
      "Starts in #{distance_of_time_in_words_to_now(contest.starts_at)}"
    elsif contest.ends_at < Time.current
      "Finished #{distance_of_time_in_words_to_now(contest.starts_at)}"
    else
      "Finishes in #{distance_of_time_in_words_to_now(contest.starts_at)}"
    end
  end
end
