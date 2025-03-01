class Libmysofa < Formula
  desc "libmysofa: simple set of C functions to read AES SOFA files"
  homepage "https://github.com/hoene/libmysofa"
  url "https://github.com/hoene/libmysofa/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "6c5224562895977e87698a64cb7031361803d136057bba35ed4979b69ab4ba76"
  license "BSD-3-Clause"
  head "https://github.com/hoene/libmysofa.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "cunit" => [:build, :test]
  depends_on "node" => :test
  depends_on "hdf5"
  depends_on "netcdf"
  depends_on "netcdf-cxx"
  depends_on :macos => :big_sur
  uses_from_macos "curl"
  uses_from_macos "zlib"
  on_linux do
    depends_on "curl"
  end

  def install
    Dir.chdir('build') {
      system "cmake", "..", *std_cmake_args
      system "make", "-j#{ENV.make_jobs}", "all"
      system "make", "install", ".."
    }
  end

  test do
    system "ctest"
  end
end
