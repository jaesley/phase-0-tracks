What are some common HTTP status codes?
  100s  Information
  200s  Success
    200 - Success
  300s  Redirects
  400s  Client Errors
    403 - Forbidden
    404 - Not Found
  500s  Server Errors
    504 - Timeout

What is the difference between a GET request and a POST request? When might each be used?
  GET requests data from the source; POST submits user data to the server instead. POST is more secure and used with sensitive information as that type of request cannot be cached and must be resubmitted if the page is reloaded etc.

Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
  Cookies are pieces of server info stored on the user's computer, ex user credentials to remember they are logged into a site, or shopping cart items that have been stored. They can also store tracking data for the user's browser. The cookie is sent back with the generating http request, and afterward sent along with further requests to the server to provide the cookie's information to the server.