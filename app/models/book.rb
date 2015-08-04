class Book < ActiveRecord::Base
  before_save { title = title.split.map(&:capitalize).join(' ') }
  VALID_NAME_REGEX = /\A[a-z\s]+[a-z\-.]\z/i
end
