cask 'dcptool' do

  version '1.11.0'
  sha256 '9049b62fd5388cf261315d7c3d637e1f7de794946e1dc756f4094cfddec76e13'

  appname = 'dcpTool'
  zipname = "#{appname}_#{version.gsub('.','_')}"
  url "https://downloads.sourceforge.net/dcptool/#{zipname}.zip"
  name appname
  desc "#{appname}: tool for editing DNG camera profiles (DCP files)"
  homepage "https://dcptool.sourceforge.net/"

  depends_on macos: '>= :catalina'

  binary "#{appname}"

  preflight do
    require 'fileutils'
    FileUtils.mv("#{staged_path}/#{zipname}/Binaries/macOS/#{appname}", "#{staged_path}/")
    FileUtils.mv("#{staged_path}/#{zipname}/Documentation", "#{staged_path}/")
    FileUtils.mv("#{staged_path}/#{zipname}/Documentation.html", "#{staged_path}/")
    FileUtils.mv("#{staged_path}/#{zipname}/gpl.txt", "#{staged_path}/")
    FileUtils.mv("#{staged_path}/#{zipname}/ReadMe.txt", "#{staged_path}/")
    FileUtils.mv("#{staged_path}/#{zipname}/Release.txt", "#{staged_path}/")
    FileUtils.rm_rf("#{staged_path}/#{zipname}")
  end

end
