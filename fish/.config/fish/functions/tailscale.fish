  function tailscale
      set -l macos_tailscale /Applications/Tailscale.app/Contents/MacOS/Tailscale

      if test -x $macos_tailscale
          $macos_tailscale $argv
      else
          command tailscale $argv
      end
  end
