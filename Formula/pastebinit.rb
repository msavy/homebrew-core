class Pastebinit < Formula
  desc "Send things to pastebin from the command-line"
  homepage "https://launchpad.net/pastebinit"
  url "https://launchpad.net/pastebinit/trunk/1.5/+download/pastebinit-1.5.tar.gz"
  sha256 "0d931dddb3744ed38aa2d319dd2d8a2f38a391011ff99db68ce7c83ab8f5b62f"

  bottle do
    cellar :any_skip_relocation
    sha256 "c4ba9f88e6fad1b21fb2b433adf16855086063c143df0b10aea669dce3df189a" => :el_capitan
    sha256 "42f4b20a8f4361de3f03077bda5c2ecdac87759723ac383b562f0c21b8791d93" => :yosemite
    sha256 "628ce64e3127dff93a92aa08019ad7c191f0b285dc8ed8cc2248c09d72abc5f5" => :mavericks
  end

  depends_on "python3"
  depends_on "docbook2x" => :build

  def install
    inreplace "pastebinit", "/usr/bin/python3", Formula["python3"].opt_bin + "python3"
    inreplace "pastebinit", "/usr/local/etc/pastebin.d", etc + "pastebin.d"
    system "docbook2man", "pastebinit.xml"
    bin.install "pastebinit"
    cp_r "pastebin.d", etc
    man1.install "PASTEBINIT.1" => "pastebinit.1"
    libexec.install "po", "utils"
  end

  test do
    system "date | pastebinit"
  end
end
