When %r{^I GET ([^\"]*)$} do |uri|
  visit uri
end

When %r{^I follow the (?:first )?"([^\"]*)" link$} do |label|
  When %{I follow the "#{label}" link with:}, ""
end

When %r{^I follow the "([^\"]*)" link with:$} do |label, body|
  doc = Nokogiri::XML(response.body)
  link = doc.xpath("//link[@rel='#{label}']").first
  interpolated_body = ERB.new(body).result(binding)
  visit link.attributes["href"].text, link.attribute("method"), interpolated_body
end

Then %r{^the response content type should be "([^\"]*)"$} do |content_type|
  response.content_type.should == content_type
end

Then %r{^the response should have a "([^\"]*)" header$} do |header|
  response.headers.should have_key(header)
end

Then %r{^the response status should be "([^\"]*)"$} do |code|
  response.status.should == code
end

Then %r{^the response should be an XML document matching:$} do |table|
  doc = Nokogiri::XML(response.body)
  table.hashes.each do |hash|
    doc.xpath(hash["xpath"]).text.should == ERB.new(hash["value"]).result(binding)
  end
end

Then %r{^the response should be an XML error "([^\"]*)"$} do |message|
  doc = Nokogiri::XML(response.body)
  doc.xpath("/error").map(&:text).should == [message]
end

Then %r{^there should be an? "([^\"]*)" link:$} do |name, table|
  doc = Nokogiri::XML(response.body)
  attributes = Hash[*table.raw.flatten]
  xpath = "//link[@rel='#{name}']" + attributes.map {|k,v| "[@#{k}='#{ERB.new(v).result(binding)}']"}.join
  doc.xpath(xpath).size.should == 1
end

Then %r{^there should be an? ([^\"]*) media type ([^\"]*) link:$} do |name, type, table|
  doc = Nokogiri::XML(response.body)
  link = doc.xpath("//media_types/media_type[@name='#{name}']/link[@rel='#{type}']").first
  attributes = Hash[*table.raw.flatten]
  attributes.each do |name, value|
    link[name].should == ERB.new(value).result(binding)
  end
end
