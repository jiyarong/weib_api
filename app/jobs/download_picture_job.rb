class DownloadPictureJob < ApplicationJob
  queue_as :default

  def perform(r_url, l_url)
    # Do something later
    require 'open-uri'
    raw_att = open(r_url)
    IO.copy_stream(raw_att, l_url)
  end
end
