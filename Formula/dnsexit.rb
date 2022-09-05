# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Dnsexit < Formula
  desc "A DNSExit dynamic ip address DNS client"
  homepage "https://github.com/christianTragesser/dnsexit-ip-update"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/christianTragesser/dnsexit-ip-update/releases/download/v0.2.0/dnsexit_0.2.0_darwin_amd64.tar.gz"
      sha256 "00c9428323c71475b388532c54e0a0f0cbec944e5b5d1f9ce903ff2760c2a8c2"

      def install
        bin.install "dnsexit-darwin-amd64"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/christianTragesser/dnsexit-ip-update/releases/download/v0.2.0/dnsexit_0.2.0_darwin_arm64.tar.gz"
      sha256 "38f86b935798b42328bd0a5e42f704580707012d1c0c2cadc26d278b8a1af327"

      def install
        bin.install "dnsexit-darwin-arm64"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/christianTragesser/dnsexit-ip-update/releases/download/v0.2.0/dnsexit_0.2.0_linux_arm64.tar.gz"
      sha256 "e1aa12fd10a89a33a995c848ca1f9f0640205f5e44a0e7e26f4b2acf7f9b0b52"

      def install
        bin.install "dnsexit-linux-arm64"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/christianTragesser/dnsexit-ip-update/releases/download/v0.2.0/dnsexit_0.2.0_linux_amd64.tar.gz"
      sha256 "128da368e454c8cd14d280296f9cc03f091b681b630daac462cee371c0467e5b"

      def install
        bin.install "dnsexit-linux-amd64"
      end
    end
  end

  def post_install
    system "rm -f /usr/local/bin/dnsexit || true"
    system "ln -s #{bin}/dnsexit-* /usr/local/bin/dnsexit"
  end

  test do
    system "/usr/local/bin/dnsexit version"
  end
end
