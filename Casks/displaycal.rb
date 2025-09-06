cask 'displaycal' do

  appname = 'DisplayCAL'
  arch arm: 'arm64', intel: 'x86_64'
  version '3.9.16'
  sha256 arm:   'b83f5ffd66e67f09db4d57bfe4507072e3fc4bea24974f4729fcafe6e504fdd7',
         intel: '50d5a6eb6fb1fd5b8adedb74dd73dbee73fd5ea53204046e993e87c2d000d099'

  url "https://github.com/eoyilmaz/displaycal-py3/releases/download/#{version}/#{appname}-#{version}-macOS-#{arch}.dmg"
  name 'DisplayCAL'
  desc 'Display Calibration and Characterization powered by ArgyllCMS'
  homepage 'https://github.com/eoyilmaz/displaycal-py3'

  app "#{appname}.app"

  depends_on macos: '>= :big_sur'
  depends_on formula: 'glib'
  depends_on formula: 'gtk+3'
  depends_on formula: 'python@3.13'

  zap trash: [
        "~/Library/Application Support/#{appname}",
        "~/Library/Preferences/#{appname}",
        "~/Library/Preferences/net.displaycal.#{appname}.plist",
      ]
end
