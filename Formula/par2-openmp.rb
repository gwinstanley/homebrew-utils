class Par2Openmp < Formula
  desc "Parchive: Parity Archive Volume Set for data recovery"
  homepage "https://github.com/Parchive/par2cmdline"
  url "https://github.com/Parchive/par2cmdline/releases/download/v0.8.1/par2cmdline-0.8.1.tar.bz2"
  sha256 "5fcd712cae2b73002b0bf450c939b211b3d1037f9bb9c3ae52d6d24a0ba075e4"
  license "GPL-2.0"
  head "https://github.com/Parchive/par2cmdline.git"

  conflicts_with "par2", :because => "both install the same binaries"
  option "without-libomp", "Compile without OpenMP support"
  depends_on "libomp" => :recommended
  depends_on :macos => :catalina

  def install
    conf_args = ["--prefix=#{prefix}"]
    if build.with? "libomp"
      conf_args.concat(["CXXFLAGS=-Xpreprocessor\ -fopenmp", "LIBS=-lomp"])
    end

    system "./configure", *conf_args
    system "make", "install"
  end

  test do
    # Protect a file with par2.
    test_file = testpath/"some-file"
    File.write(test_file, "file contents")
    system "#{bin}/par2", "create", test_file

    # "Corrupt" the file by overwriting, then ask par2 to repair it.
    File.write(test_file, "corrupted contents")
    repair_command_output = shell_output("#{bin}/par2 repair #{test_file}")

    # Verify that par2 claimed to repair the file.
    assert_match "1 file(s) exist but are damaged.", repair_command_output
    assert_match "Repair complete.", repair_command_output

    # Verify that par2 actually repaired the file.
    assert File.read(test_file) == "file contents"
  end
end
