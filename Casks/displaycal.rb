cask 'displaycal' do

  appname = 'DisplayCAL'
  arch arm: 'arm64', intel: 'x86_64'
  classifier = on_arch_conditional arm: 'arm64', intel: 'x86'
  version '3.9.19'
  sha256 arm:   'e2a9e075e9ed30aafe6612d11578d217e3e80489fd6d50459406c112a3d7db19',
         intel: 'dc0ca1107c5cd8c3dc67562445a642057716550a582430f17609ce2f80d2d50b'

  url "https://github.com/eoyilmaz/displaycal-py3/releases/download/#{version}/#{appname}-#{version}-macOS-#{classifier}.dmg"
  name 'DisplayCAL'
  desc 'Display Calibration and Characterization powered by ArgyllCMS'
  homepage 'https://github.com/eoyilmaz/displaycal-py3'

  app "#{appname}.app"

  depends_on :macos
  depends_on formula: 'glib'
  depends_on formula: 'gtk+3'
  depends_on formula: 'python@3.14'

  zap trash: [
        "~/Library/Application Support/#{appname}",
        "~/Library/Preferences/#{appname}",
        "~/Library/Preferences/net.displaycal.#{appname}.plist",
      ]
end
