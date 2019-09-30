$JsFile = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
# Source maps to make it easier to debug in the browser 
$Maps = Get-ChildItem "$PSScriptRoot\*.map"

$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterScript($JsFile.FullName)
# Register all the source map files so we can make debugging easier.
foreach ($item in $Maps) {
    [UniversalDashboard.Services.AssetService]::Instance.RegisterAsset($item.FullName) | Out-Null
}

function New-UDVideoPlayer {
    param
    (
        [Parameter()]
        [string]$Id = [guid]::NewGuid(),
        [Parameter()]
        [string]$ClassName,
        [Parameter(Mandatory)]
        [string]$Url,
        [Parameter()]
        [switch]$Playing,
        [Parameter()]
        [switch]$Loop,
        [Parameter()]
        [switch]$Controls,
        [Parameter()]
        [switch]$Light,
        [Parameter()]
        [float]$Volume = 0.45,
        [Parameter()]
        [switch]$Muted,
        [Parameter()]
        [int]$Width = 640,
        [Parameter()]
        [int]$Height = 360,
        [Parameter()]
        [hashtable]$Style,
        [Parameter()]
        [int]$ProgressInterval,
        [Parameter()]
        [switch]$PlaysInLine,
        [Parameter()]
        [switch]$Pip
    )

    End {

        @{
            assetId          = $AssetId 
            isPlugin         = $true 
            id               = $Id 
            type             = 'ud-videoplayer'
            url              = $Url
            playing          = $Playing.IsPresent
            loop             = $Loop.IsPresent
            controls         = $Controls.IsPresent
            light            = $Light.IsPresent
            volume           = $Volume
            muted            = $Muted.IsPresent
            width            = $Width
            height           = $Height
            style            = $Style
            progressInterval = $ProgressInterval
            playsinline      = $PlaysInLine.IsPresent
            pip              = $Pip.IsPresent
            className        = $ClassName
        }
    }
}
