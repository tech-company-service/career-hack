HASH_ID_LENGTH = 15

Hashid::Rails.configure do |config|
  # The salt to use for generating hashid.
  config.salt = 'YCV6ULfErQ6FgcHeCQPFBzlMAbxr9C1BeTp3WTggWjeVkRV8ceWZaOCKI8QFFmKc'

  # The minimum length of generated hashids
  config.min_hash_length = HASH_ID_LENGTH

  # Whether to override the `find` method
  config.override_find = false
end
