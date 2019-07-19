SimpleCov.at_exit do
  # TODO: Add hook to post coverage % on Github
  SimpleCov.result.format!
end

# Uncomment this line if you want to enforce a
# minimum coverage.
# SimpleCov.minimum_coverage 90

SimpleCov.start "rails"
