# typed: false
# frozen_string_literal: true

class DolphinAi < Formula
  desc "dolphin-ai is an AI agent platform with multi-agent coordination,
MCP tool integration, skills, cron tasks, and multi-provider LLM support.
"
  homepage "https://github.com/dolphinZzv/dolphin"
  version "0.2.10"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dolphinZzv/dolphin/releases/download/v0.2.10/dolphin-ai_0.2.10_macOS_x86_64.tar.gz"
      sha256 "fb4b2ee32245fe2e3b5eb203644a17186f769587f6fd894af7d1a43ef20aa4e2"

      define_method(:install) do
        bin.install "dolphin-ai"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/dolphinZzv/dolphin/releases/download/v0.2.10/dolphin-ai_0.2.10_macOS_arm64.tar.gz"
      sha256 "2845d101ccbce9c0d629d75fdb5e162d2392d547dbe873726793e82b990393b8"

      define_method(:install) do
        bin.install "dolphin-ai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/dolphinZzv/dolphin/releases/download/v0.2.10/dolphin-ai_0.2.10_linux_x86_64.tar.gz"
      sha256 "9d05596de2295422a6bcc80d79afab8173cadc2ee79b461683a273cd71e7f573"
      define_method(:install) do
        bin.install "dolphin-ai"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dolphinZzv/dolphin/releases/download/v0.2.10/dolphin-ai_0.2.10_linux_arm64.tar.gz"
      sha256 "ac4a3124c9e62ad83786b683b234c7330139b9368bf85c56eb125098679e238d"
      define_method(:install) do
        bin.install "dolphin-ai"
      end
    end
  end

  service do
    run [opt_bin/"dolphin-ai", "setup"]
    keep_alive true
    log_path var/"log/dolphin-ai.log"
    error_log_path var/"log/dolphin-ai.log"
  end

  def caveats
    <<~EOS
      dolphin-ai is installed. Run `dolphin-ai setup` to get started.

      For CDP browser automation, install chromium or google-chrome.
      See https://github.com/dolphinZzv/dolphin for documentation.
    EOS
  end
end