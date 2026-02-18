$urls = @(
    "https://postimg.cc/4mFrmVKG",
    "https://postimg.cc/nCw73Y0T",
    "https://postimg.cc/kVygp7qp",
    "https://postimg.cc/p5mVr8zV"
)

foreach ($u in $urls) {
    try {
        $web = Invoke-WebRequest -Uri $u -UseBasicParsing
        if ($web.Content -match '<meta property="og:image" content="([^"]+)"') {
            Write-Output "$u -> $($matches[1])"
        } else {
            Write-Output "$u -> Not Found"
        }
    } catch {
        Write-Output "$u -> Error: $_"
    }
}
