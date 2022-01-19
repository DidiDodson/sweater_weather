class Background
  attr_reader :id,
              :image

  def initialize(data)
    @id = nil
    @image = image_hash(data)
  end

  def image_hash(image_data)
    {
      description: image_data[:description],
      image_url: image_data[:urls][:regular],
      credit: {
        author: image_data[:user][:name],
        portfolio_url: image_data[:user][:links][:portfolio],
        profile_pic: image_data[:user][:profile_image][:large],
        hosted_on: "Unsplash"}
      }
  end
end
