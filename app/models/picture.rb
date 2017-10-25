class Picture < ApplicationRecord
  belongs_to :card

  after_create :download_remote_picture
  before_create :write_local_url

  def http_url
    self.local_url.gsub(Rails.root.to_s + "/public", "")
  end

  private
  def write_local_url
    dir = File.join(Rails.root, "/public/ws_pictures", "/#{self.card.id/1000}")
    FileUtils.mkdir_p dir unless File.exist?(dir)
    self.local_url = dir + "/" + self.card.id.to_s + ".png"
  end

  def download_remote_picture
    DownloadPictureJob.perform_later(self.remote_url, self.local_url)
  end
end
