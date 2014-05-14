# Custom Helper managing string
module StringHelper
  def random_string_size_of(size)
    SecureRandom.urlsafe_base64.first(size)
  end
end
