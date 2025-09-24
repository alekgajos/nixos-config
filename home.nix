{ lib, pkgs, ... }:
{
    home = {
        packages = with pkgs; [
            hello
        ];

        username = "alek";
        homeDirectory = "/home/alek";

        stateVersion = "23.11";
    };
}