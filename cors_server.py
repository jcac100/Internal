from http.server import HTTPServer, SimpleHTTPRequestHandler
import sys

class CORSRequestHandler(SimpleHTTPRequestHandler):
    def end_headers(self):
        # This header tells the browser "Everyone is allowed to talk to me"
        self.send_header('Access-Control-Allow-Origin', '*')
        SimpleHTTPRequestHandler.end_headers(self)

    # Suppress standard logging to make our custom logs easier to see
    def log_message(self, format, *args):
        sys.stderr.write("%s - - [%s] %s\n" %
                         (self.client_address[0],
                          self.log_date_time_string(),
                          format%args))

if __name__ == '__main__':
    # Listen on all interfaces on port 9000
    print("Starting CORS-enabled server on port 9000...")
    HTTPServer(('0.0.0.0', 9000), CORSRequestHandler).serve_forever()
