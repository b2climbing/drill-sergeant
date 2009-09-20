Factory.define :exercise do |f|
  f.sequence(:name){|n| "Exercise #{n}"}
end

Factory.define :sequence do |f|
  f.sequence(:name){|n| "Sequence #{n}"}
  f.sequence(:description){|n| "Description #{n}"}
end

Factory.define :sequence_exercise do |f|
  f.association :exercise
  f.association :sequence
end