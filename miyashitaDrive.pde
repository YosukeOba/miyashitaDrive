import processing.net.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.io.File;
import java.io.FilenameFilter;

Server server;
byte [] sendData;

void setup(){
  size(200,200);
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
        String name = "YosukeOba";
        server.write("promea"+'\n');
        File dir = new File(dataPath("")+"/"+receiveData);
        
        File[] filename = dir.listFiles();
        for(int i = 0; i < filename.length; i++){
          server.write(""+ filename[i]+'\n');
          Path file = Paths.get(""+filename[i]);
          try{
            sendData = Files.readAllBytes(file);
          } catch(IOException e){
            e.printStackTrace();
          }
          client.write(sendData);
        }
    }
    
  }
}
