# https://developer.chrome.com/extensions/external_extensions.html
# PL: I think Chrome disabled automating installs as a security feature.

# Useful Extensions

# Open chrome extensions in the browser
chrome_ext () {
  app=$1
  webstore=https://chrome.google.com/webstore/detail/
  open "$webstore$app"
}

echo "Now we're going to open some Chrome extensions to install from the Chrome Webstore"
echo "Just click 'Free' to install them."
echo "If you've alread installed them you'll see 'Added to Chrome'"
echo "Ready?"
read -p "Just hit enter!"

chrome_ext jsonview/chklaanhfefbnpoihckbnefhakgolnmc                  # Validate and view JSON documents
chrome_ext livereload/jnihajbhpnppcggbcgedagnkighmdlei                # Integration with LiveReload App and guard-livereload
chrome_ext pagespeed-insights-by-goo/gplegfbjlmmehdoakndmohflojccocli # analyzes the performance of web pages and provides suggestions to make them faster
chrome_ext postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm       # REST Client to test in Browser
chrome_ext speed-tracer-by-google/ognampngfcbddbfemdapefohjiobgbdl    # a tool to help you identify and fix performance problems in your web applicatio

# fin #
