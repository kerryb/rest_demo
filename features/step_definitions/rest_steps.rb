When %r{^I GET ([^\"]*)$} do |uri|
  visit uri
end

Then %r{^the response content type should be "([^\"]*)"$} do |content_type|
  response.content_type.should == content_type
end

Then %r{^the response status should be "(.*)"$} do |code|
  response.status.should == code
end

Then %r{^the response should be an XML error "([^\"]*)"$} do |message|
  doc = Nokogiri::XML(response.body)
  doc.xpath("/error").map(&:text).should == [message]
end

Then %r{^there should be an? (\S*) link:$} do |name, table|
  doc = Nokogiri::XML(response.body)
  link = doc.xpath("//link[@rel='#{name}']").first
  attributes = Hash[*table.raw.flatten]
  attributes.each do |name, value|
    link[name].should == ERB.new(value).result(binding)
  end
end

Then %r{^there should be an? ([^\"]*) media type ([^\"]*) link:$} do |name, type, table|
  doc = Nokogiri::XML(response.body)
  link = doc.xpath("//media_types/media_type[@name='#{name}']/link[@rel='#{type}']").first
  attributes = Hash[*table.raw.flatten]
  attributes.each do |name, value|
    link[name].should == ERB.new(value).result(binding)
  end
end
