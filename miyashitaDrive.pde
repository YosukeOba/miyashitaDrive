import processing.net.*;

Server server;

void setup(){
  server = new Server(this, 50000);
  if(server.active() == false){
    println("error");
    exit();
  }
}

void draw(){
  Client client = server.available();
  
  if(client != null){
    int receiveSize = client.available();
    if( receiveSize > 0 ){
      String receiveData = client.readStringUntil('')
    }
    
  }
}
