app_sid = '77******-1***-4***-a***-8***********'
app_key = '89******************************'
Aspose::Cloud::Common::AsposeApp.new(app_sid, app_key)

#build URI to create PDF from HTML
str_uri = 'http://api.aspose.com/v1.1/pdf/outPdfFile.pdf?templateFile=HtmlExample1.html&templateType=html'

#sign URI
signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
RestClient.put(signed_uri, '', {:accept=>'application/json'})

#build URI to download output file
str_uri = 'http://api.aspose.com/v1.1/storage/file/outPdfFile.pdf'

#sign URI
signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
response_stream = RestClient.get(signed_uri, :accept => 'application/json')
Aspose::Cloud::Common::Utils.save_file(response_stream, "outPdfFile.pdf")
p 'done'