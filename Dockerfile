# Simple Python web server
FROM python:3.11-alpine

RUN echo 'from http.server import HTTPServer, BaseHTTPRequestHandler' > app.py && \
    echo 'class Handler(BaseHTTPRequestHandler):' >> app.py && \
    echo '    def do_GET(self):' >> app.py && \
    echo '        self.send_response(200)' >> app.py && \
    echo '        self.send_header("Content-type", "text/html")' >> app.py && \
    echo '        self.end_headers()' >> app.py && \
    echo '        self.wfile.write(b"<h1>Hello from Docker!</h1><p>Built with GitHub Actions</p><p>Deliverd by Omar</p>")' >> app.py && \
    echo 'HTTPServer(("", 8000), Handler).serve_forever()' >> app.py

EXPOSE 8000

CMD ["python", "app.py"]