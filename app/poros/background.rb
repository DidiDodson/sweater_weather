class Background
  attr_reader :id,
              :type,
              :image


  def initialize(data)
    @id = nil
    @type = "image"
    @image = {
      description: data[:description],
      image_url: data[:urls][:regular],
      credit: {
        author: data[:user][:name],
        portfolio_url: data[:user][:links][:portfolio],
        profile_pic: data[:user][:profile_image][:large],
        hosted_on: "Unsplash"}
      }
  end
end
