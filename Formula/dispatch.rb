# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Dispatch < Formula
  desc "A CLI utility for deploying KOPS Kubernetes in AWS"
  homepage "https://github.com/christianTragesser/dispatch"
  version "0.1.3"
  license "MIT"

  on_macos do
    url "https://github.com/christianTragesser/dispatch/releases/download/v0.1.3/dispatch_0.1.3_darwin_amd64.tar.gz"
    sha256 "1183f3fb44c0c6a286290c3aaeee89517342a7a51ebbfce4d68a36f5b07f91f1"

    def install
      bin.install "dispatch-darwin-amd64"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the Dispatch
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/christianTragesser/dispatch/releases/download/v0.1.3/dispatch_0.1.3_linux_amd64.tar.gz"
      sha256 "b19d671d2e72b99aa60e7ddfaeff03c9c965818fe23cf0b80c25d51ae12db174"

      def install
        bin.install "dispatch-linux-amd64"
      end
    end
  end

  def post_install
    system "rm -f /usr/local/bin/dispatch || true"
    system "ln -s #{bin}/dispatch-* /usr/local/bin/dispatch"
  end

  test do
    system "#{bin}/dispatch version"
  end
end
