function handler(event) {
  var request = event.request;
  var uri = request.uri;
  var rewrites = []

  for (var arrayIndex in rewrites){
    if (request.uri == rewrites[arrayIndex][0]) {
      var newUri = rewrites[arrayIndex][1];

      var response = {
        statusCode: 301,
        statusDescription: 'Permanently moved',
        headers: {
          location: {
            value: newUri
          },
        },
      }
      return response;
    }
  }

  // Check whether the URI is missing a file name.
  if (uri.endsWith('/')) {
      request.uri += 'index.html';
  }
  // Check whether the URI is missing a file extension.
  else if (!uri.includes('.')) {
      request.uri += '/index.html';
  }

  return request;
}