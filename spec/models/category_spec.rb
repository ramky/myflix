require 'spec_helper'

describe Category do
  it { should have_many (:videos) }
  it { should validate_presence_of(:name) }

  
  describe "#recent_videos" do
    it "returns ther videos in the reverse chronical order by created_at" do
      comedy     = Category.create(name: 'comedy')
      futurama   =    Video.create(title: 'Futurama', description: 'space travel', categories: [comedy], created_at: 1.day.ago)
      south_park =    Video.create(title: 'South Park', description: 'crazy kids', categories: [comedy])
      
      expect(comedy.recent_videos.count).to eq(2)
    end

    it "returns all the videos if there are less than 6 videos" do
      comedy = Category.create(name: 'comedy')
      7.times do
        Video.create(title: 'foo', description: 'bar', categories: [comedy])
      end

      expect(comedy.recent_videos.count).to eq(6)
    end

    it "return the most recent 6 videos" do
      comedy = Category.create(name: 'comedy')
      6.times do
        Video.create(title: 'foo', description: 'bar', categories: [comedy])
      end
      tonights_show = Video.create(title: 'tonights show', description: 'bar', categories: [comedy], created_at: 1.day.ago)

      expect(comedy.recent_videos).not_to include(tonights_show)
    end
    
    it "returns an empty array if the category does not have any videos" do
      comedy = Category.create(name: 'comedy')

      expect(comedy.recent_videos).to eq([])
    end
  end
end

