{ inputs, lib, pkgs, ... }:
{

  # nixpkgs.overlays = [
  #   inputs.neovim-nightly-overlay.overlays.default
  # ];


	imports = [
		# inputs.niri.homeModules.niri
		# inputs.dankMaterialShell.homeModules.dankMaterialShell.default
		# inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
	];
	# programs.dank-material-shell.enable = true;
	# programs.niri.enable = true;

	systemd.user.sessionVariables = {
			ELECTRON_OZONE_PLATFORM_HINT="auto";
			XDG_MENU_PREFIX="plasma-";
			QT_QPA_PLATFORM_PLUGIN_PATH="${pkgs.libsForQt5.qt5.qtbase.bin}/lib/qt-${pkgs.libsForQt5.qt5.qtbase.version}/plugins";
			QT_QPA_PLATFORM="wayland";
			CODESTRAL_API_KEY="";
		};

	programs.bash = {
		enable = true;
		shellAliases = {
			scala-dev = "nix develop github:typelevel/typelevel-nix#application";
			chrome-root = "sudo -E google-chrome-stable  --no-sandbox -–ozone-platform=wayland";
		};

    bashrcExtra = ''
      # rust
      . "$HOME/.cargo/env"
      # Amp CLI
      export PATH="$HOME/.local/bin:$PATH"
    '';
	};

	home = {
		packages = [
      pkgs.home-manager
			pkgs.lazygit
			pkgs.zed-editor
			pkgs.gnuradio
			pkgs.zigpkgs.master
			inputs.zls.packages.${pkgs.system}.zls
			pkgs.neovim
      pkgs.tree-sitter
      pkgs.vimPlugins.blink-cmp
      pkgs.darktable
      pkgs.kdePackages.gwenview
      pkgs.cmake
		];


		username = "alek";
		homeDirectory = "/home/alek";


		stateVersion = "25.11";


		sessionVariables = {
			ELECTRON_OZONE_PLATFORM_HINT="auto";
			XDG_MENU_PREFIX="plasma-";
			QT_QPA_PLATFORM_PLUGIN_PATH="${pkgs.libsForQt5.qt5.qtbase.bin}/lib/qt-${pkgs.libsForQt5.qt5.qtbase.version}/plugins";
			QT_QPA_PLATFORM="wayland";
		};

	};


	xdg.enable = true;

	# xdg.portal = {
	# 	enable = true;
	# 	# xdgOpenUsePortal = true;
	#
	# 	# config.niri = {
	# 	# 	default = ["gnome" "gtk"];
	# 	# 	"org.freedesktop.impl.portal.Access" = "gtk";
	# 	# 	"org.freedesktop.impl.portal.FileChooser" = "gtk";
	# 	# 	"org.freedesktop.impl.portal.ScreenCast" = "gnome";
	# 	# 	"org.freedesktop.impl.portal.Secret" = "gnome-keyring";
	# 	# };
	# 	#
	# 	# extraPortals = [
	# 	# 	pkgs.xdg-desktop-portal-gnome
	# 	# 	pkgs.xdg-desktop-portal-gtk
	# 	# ];
	# 	# configPackages = [
	# 	# 	pkgs.xdg-desktop-portal-gnome
	# 	# 	pkgs.xdg-desktop-portal-gtk
	# 	# ];
	#
	# 	# config.common.default = "gtk";
	# };


}
