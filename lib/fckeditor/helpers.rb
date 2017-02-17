module Fckeditor
  # Helpers are made of several helpers that cannot be turned on automatically.
  # For instance, disabled cannot be turned on automatically, it requires the
  # user to explicitly pass the option :disabled => true so it may work.
  module Helpers
    autoload :Textarea, 'fckeditor/helpers/textarea'
    autoload :Remote,   'fckeditor/helpers/remote'
  end
end
