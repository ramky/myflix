require 'spec_helper'

describe Video do
  it "saves itself" do
    video = Video.new(title: "monk", description: "a great video")
    video.save

    expect(Video.first).to eq(video)
  end

  it "belongs to category" do
    drama = Category.create(name: "drama")
    monk  = Video.create(title: "monk", description: "a great video", categories: [drama])
    expect(monk.categories).to eq([drama])
  end
end
