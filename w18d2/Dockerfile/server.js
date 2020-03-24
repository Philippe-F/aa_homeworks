var http = require("http");

http
  .createServer(function (req, res) {
    res.write("Hello Young Black World! It's good to be here, fam.");
    res.end();
  })
  .listen(8000);