import processing.net.*;

Server server;

void setup(){
  server = new Server(this, 50000);
  if(server.active() == false){
    println("error");
    exit();
  }
  println(server.ip());
}

void draw(){
  Client client = server.available();
  
  if(client != null){
    int receiveSize = client.available();
    if( receiveSize > 0 ){
      String receiveData = client.readStringUntil('\n').trim();
      println("receivedData = " + receiveData);
      if(receiveData.equals("test")){
        server.write("promea"+'\n');
      }
    }
    
  }
}
