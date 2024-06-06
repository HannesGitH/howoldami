{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      spkgs = forAllSystems (system: import nixpkgs { 
        inherit system; 
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      });
    in rec
    {
      deps = forAllSystems (system: with spkgs.${system}; [
        flutter
        git
      ]);

      android-data = {
        abiVersion = "x86_64";
        platformVersion = "34";
      };

      android = forAllSystems (system: spkgs.${system}.androidenv.composeAndroidPackages {
        buildToolsVersions = [ "28.0.3" "30.0.3" ];
        platformVersions = [ "28" "33" "31" android-data.platformVersion ];
        abiVersions = [ "armeabi-v7a" "arm64-v8a" android-data.abiVersion ];
      });

      packages = forAllSystems (system:  rec {
        avd = spkgs.${system}.androidenv.emulateApp {
          name = "run-test-emulatorem";
          platformVersion = android-data.platformVersion;
          abiVersion = android-data.abiVersion; # armeabi-v7a, mips, x86_64
          systemImageType = "google_apis_playstore";
          # deviceName = "test-emulator";
        };
        default = avd;
      });

      devShells = forAllSystems (system: let pkgs = spkgs.${system}; in rec {
         apk = pkgs.mkShell rec {
            name = "apk";
            buildInputs = with pkgs; [ jdk17 android-tools ] ++ deps.${system} ++ [android.${system}.androidsdk packages.${system}.avd];
            ANDROID_SDK_ROOT = "${android.${system}.androidsdk}/libexec/android-sdk";
            shellHook = ''
              export ANDROID_SDK_ROOT=${ANDROID_SDK_ROOT}
            '';
          };

          web = pkgs.mkShell rec {
            name = "web";
            buildInputs = with pkgs; deps ++ [ google-chrome ];
            CHROME_EXECUTABLE = "${pkgs.google-chrome}/bin/google-chrome-stable";
            shellHook = ''
              export CHROME_EXECUTABLE=${CHROME_EXECUTABLE}
            '';
          };

          default = apk;
      });
    };
}
