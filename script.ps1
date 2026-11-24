# Téléchargement fond d'écran
$wallpaperUri = "https://github.com/suyaseongi/rubber-ducky-tp/blob/main/wallpaper-1.jpg?raw=true"
$wallpaperPath = Join-Path %USERPROFILE% "\Pictures\wallpaper-1.jpg"
Start-BitsTransfer –source $wallpaperUri -destination $wallpaperPath

# Définition fond d'écran
# source : https://techexpert.tips/powershell/powershell-configure-wallpaper/
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 
[Win32.Wallpaper]::SetWallpaper($wallpaperPath)
