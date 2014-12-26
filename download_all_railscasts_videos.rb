require 'mechanize'
a = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}
url=your_subscription_url
doc=nil
a.get url
for i in 1..420
  begin
    url="http://railscasts.com/episodes/#{i}"
    a.get url do |page| 
      doc=page.parser
      dir=doc.css('title')[0].text.gsub(/[^a-zA-Z0-9 ]/,"").gsub(/ /,"_")
      Dir.mkdir(dir,0755)
      puts %x(cd #{dir} && wget #{doc.css('a:contains("source code")')[0]["href"]}) if doc.css('a:contains("source code")').length > 0
      puts %x(cd #{dir} && wget #{doc.css('a:contains("mp4")')[0]["href"]})  if doc.css('a:contains("mp4")').length > 0
    end
  rescue Exception => e
    puts e
  end
end