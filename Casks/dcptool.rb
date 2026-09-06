cask 'dcptool' do

  version '1.11.0'
  sha256 '9049b62fd5388cf261315d7c3d637e1f7de794946e1dc756f4094cfddec76e13'

  appname = 'dcpTool'
  zipname = "#{appname}_#{version.gsub('.','_')}"
  url "https://downloads.sourceforge.net/dcptool/#{zipname}.zip"
  name appname
  desc "#{appname}: tool for editing DNG camera profiles (DCP files)"
  homepage "https://dcptool.sourceforge.net/"

  depends_on :macos

  preflight_steps do
    move_contents "#{zipname}", "."
    remove "#{zipname}", recursive: true
    remove "Binaries/Windows", recursive: true
    remove "#{appname}.xcodeproj", recursive: true
    remove "#{appname}.*"
    remove "dng_sdk", recursive: true
    remove "iconv", recursive: true
    remove "libxml2", recursive: true
    remove "XMPStub", recursive: true
    remove "*.cpp"
    remove "*.h"
    set_permissions "Binaries/macOS/#{appname}", "0755"
  end

  binary "Binaries/macOS/#{appname}"

  caveats "To bypass macOS quarantine for the binary:\nxattr -r -d com.apple.quarantine \"#{caskroom_path}/#{version}/Binaries/macOS/#{appname}\""

end
