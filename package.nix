{ lib
, buildDotnetModule
, dotnetCorePackages
, fetchFromGitHub
, fontconfig
, icu
, libGL
, libx11
, libice
, libsm
, libxi
, libxext
, libxcursor
, libxrandr
, libxrender
, libxtst
, libxxf86vm
}:

buildDotnetModule rec {
  pname = "stardrop";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "Floogen";
    repo = "Stardrop";
    rev = "v${version}";
    hash = "sha256-47HSccA8z+bftQzBseRN3NfnsVynnE1rgvZpV6wPlGM=";
  };

  projectFile = "Stardrop/Stardrop.csproj";

  nugetDeps = ./deps.json;

  dotnet-sdk = dotnetCorePackages.sdk_8_0;

  executables = [
    "Stardrop"
  ];

  runtimeDeps = [
    fontconfig
    icu
    libGL
    libx11
    libice
    libsm
    libxi
    libxext
    libxcursor
    libxrandr
    libxrender
    libxtst
    libxxf86vm
  ];

  meta = {
    description = "Cross-platform mod manager for Stardew Valley";
    homepage = "https://github.com/Floogen/Stardrop";
    license = lib.licenses.gpl3Only;
    mainProgram = "Stardrop";
  };
}
