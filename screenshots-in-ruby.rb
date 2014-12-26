require 'grabzitclient'
 
grabzItClient = GrabzItClient.new("YOUR APPLICATION KEY", "YOUR APPLICATION SECRET")
grabzItClient.save_picture("http://www.google.com", "images/test.jpg")