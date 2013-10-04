require_relative '../../app/models/legislator'

Legislator.where(title: 'Sen').each do |senator|
  Senator.create!(legislator_id: senator.id)
end

Legislator.where(title: 'Rep').each do |rep|
  Representative.create!(legislator_id: rep.id)
end
