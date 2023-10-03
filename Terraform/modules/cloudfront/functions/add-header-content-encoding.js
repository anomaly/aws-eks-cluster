/**
 * Cloudfront function: add-content-encoding.js
 * Adds Content-Endcoding header for gziped files 
 */

function handler(event) {

	// Get the request to match the Uri
	var request = event.request;
	// Get the response to modify headers
	var response = event.response;

	if(request.uri.search('unityweb') !== -1) {

		response.headers['content-encoding'] = {
			value: 'gzip'
		}
	}

	console.log(response);

	return response;

}