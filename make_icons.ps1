Add-Type -AssemblyName System.Drawing

function New-Icon($size, $path) {
    $bmp = New-Object System.Drawing.Bitmap $size, $size
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    # background: rounded square with indigo color
    $bgColor = [System.Drawing.Color]::FromArgb(79, 70, 229)
    $brush = New-Object System.Drawing.SolidBrush $bgColor
    $rect = New-Object System.Drawing.Rectangle 0, 0, $size, $size
    $g.FillRectangle($brush, $rect)

    # white checkmark
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::White), ([Math]::Max(8, $size / 16))
    $pen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $pen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
    $pen.LineJoin = [System.Drawing.Drawing2D.LineJoin]::Round

    $s = $size
    $p1 = New-Object System.Drawing.PointF (([float]($s * 0.25)), ([float]($s * 0.52)))
    $p2 = New-Object System.Drawing.PointF (([float]($s * 0.45)), ([float]($s * 0.70)))
    $p3 = New-Object System.Drawing.PointF (([float]($s * 0.78)), ([float]($s * 0.32)))

    $g.DrawLines($pen, @($p1, $p2, $p3))

    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
    $pen.Dispose()
    $brush.Dispose()
}

$dir = Split-Path -Parent $MyInvocation.MyCommand.Path
New-Icon 192 (Join-Path $dir "icon-192.png")
New-Icon 512 (Join-Path $dir "icon-512.png")
Write-Host "Icons created."
