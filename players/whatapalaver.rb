Player.register("whatapalaver") do |history|
  options = [:share, :steal]
  probabilities = [0.7, 0.3]
  loaded_options = options.zip(probabilities).flat_map { |option, probability| [option] * (probability * 100).to_i }
  if history.empty?
    loaded_options.sample
  else
    history.last.reject { |name, _move| name == :own }.values.last == :steal ? :steal : loaded_options.sample
  end
end
