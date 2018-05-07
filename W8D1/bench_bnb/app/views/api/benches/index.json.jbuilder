@benches.each do |bench|
  json.set! bench.id do
    json.partial! 'api/benches/bench.json.jbuilder', bench: bench
  end
end
