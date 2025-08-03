class Dcamprof < Formula
  desc 'a digital camera profiling tool'
  homepage 'https://torger.se/anders/dcamprof.html'
  license 'GPL-3.0'

  url 'https://torger.se/anders/files/dcamprof-1.0.6.tar.bz2'
  sha256 'e7540939193b3eb70c1863c1c817b1c4d0495239972e8085597d6793037bab6b'

  depends_on 'gcc' => :build
  depends_on 'little-cms2'
  depends_on 'libtiff'
  depends_on 'libomp'

  def install
    txt = File.read('Makefile')
    mod = txt.gsub(/^(CC\s*=\s*).*$/, '\1 ' + Formula['gcc'].bin + '/gcc-' + Formula['gcc'].version.major.to_str)
    mod = mod.gsub(/^(LDFLAGS\s*=.*)$/, '\1 -L/opt/homebrew/lib')
    mod = mod.gsub(/^(INCLUDE\s*=.*)$/, '\1 -I/opt/homebrew/include')
    File.open('Makefile', 'w') { |f| f.puts mod }
    system 'make'
    bin.install 'dcamprof'
  end

  test do
    assert_match(/DCamProf .+Usage.+/, shell_output("#{bin}/dcamprof"))
  end
end
