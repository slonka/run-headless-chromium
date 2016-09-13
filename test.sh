#/bin/bash

(cd site && python -m SimpleHTTPServer &)

LOG_CR_VERBOSITY=. node ./run-headless-chromium.js --no-sandbox http://localhost:8000/index.html
