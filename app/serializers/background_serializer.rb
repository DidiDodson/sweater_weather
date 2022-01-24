# class BackgroundSerializer
#   include JSONAPI::Serializer
#
#   set_type "image"
#
#   attributes :image
# end

class BackgroundSerializer
  class << self
    def images(data)
      data.map do |image|
        { id: nil,
          type: "images",
          description: image[:description],
          image_url: image[:urls][:regular],
          credit: {
            author: image[:user][:name],
            portfolio_url: image[:user][:links][:portfolio],
            profile_pic: image[:user][:profile_image][:large],
            hosted_on: "Unsplash"}
          }
      end
    end
  end
end
