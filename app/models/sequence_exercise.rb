class SequenceExercise < ActiveRecord::Base
  belongs_to :sequence
  belongs_to :exercise
  named_scope :ordered, :order => "exercise_order asc"

  def duration
    time_as_hash(self.time) if self.time
  end

private
  def time_as_hash(time_in_seconds, append={})
    return append if time_in_seconds == 0
    if time_in_seconds < 60
      append.merge!(:seconds => time_in_seconds)
    elsif time_in_seconds < 3600
      append.merge!(:minutes => time_in_seconds / 60)
      time_as_hash(time_in_seconds % 60, append)
    else
      append.merge!(:hours => time_in_seconds / 3600)
      time_as_hash(time_in_seconds % 3600, append)
    end
  end
end