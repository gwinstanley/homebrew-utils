cask 'displaycal' do

  appname = 'DisplayCAL'
  arch arm: 'arm64', intel: 'x86_64'
  classifier = on_arch_conditional arm: 'arm64', intel: 'x86'
  version '3.9.17'
  sha256 arm:   'ca39277dc3d452edfe0badfe2cd56b781a1155a5f24affffa679777c862209e4',
         intel: '06065f858d3aa95f3b62c555027fae6a0ddb7912b7aeebbd41063c972f9dc34e'

  url "https://github.com/eoyilmaz/displaycal-py3/releases/download/#{version}/#{appname}-#{version}-macOS-#{classifier}.dmg"
  name 'DisplayCAL'
  desc 'Display Calibration and Characterization powered by ArgyllCMS'
  homepage 'https://github.com/eoyilmaz/displaycal-py3'

  app "#{appname}.app"

  depends_on :macos
  depends_on formula: 'glib'
  depends_on formula: 'gtk+3'
  depends_on formula: 'python@3.13'

  zap trash: [
        "~/Library/Application Support/#{appname}",
        "~/Library/Preferences/#{appname}",
        "~/Library/Preferences/net.displaycal.#{appname}.plist",
      ]
end
