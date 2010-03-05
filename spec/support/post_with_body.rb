def post_with_body method, body
  request.env['RAW_POST_DATA'] = body
  request.env['CONTENT_LENGTH'] = body.size
  post method
end
