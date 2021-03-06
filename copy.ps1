$NDKPath = Get-Content $PSScriptRoot/ndkpath.txt

$buildScript = "$NDKPath/build/ndk-build"
if (-not ($PSVersionTable.PSEdition -eq "Core")) {
    $buildScript += ".cmd"
}

& $buildScript NDK_PROJECT_PATH=$PSScriptRoot APP_BUILD_SCRIPT=$PSScriptRoot/Android.mk NDK_APPLICATION_MK=$PSScriptRoot/Application.mk
& adb push libs/arm64-v8a/libriku1227_quest_darth_maul.so /sdcard/Android/data/com.beatgames.beatsaber/files/mods/libriku1227_quest_darth_maul.so
& adb shell am force-stop com.beatgames.beatsaber
