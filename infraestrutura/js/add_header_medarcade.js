function handler(event) {
  var response = event.response;
  var headers = response.headers;
  headers['cache-control'] = {value: 'public,max-age=31536000,immutable'};

  return response;
}