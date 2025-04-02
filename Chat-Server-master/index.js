const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 5000;
var server = http.createServer(app);
var io = require("socket.io")(server);

//middlewre
app.use(express.json());
var clients = {};

app.route("/").get((req,res)=>{res.json("hhhhhhhhhhhhhhhhhhhhhhhhhh")})
io.on("connection", (socket) => {
  console.log("connetetd");
  console.log(socket.id, "has joined");
  socket.on("signin", (id) => {
    console.log(id);
    clients[id] = socket;
    console.log(clients);
  });
  socket.on("message", (msg) => {
    console.log(msg);
    //socket.broadcast.emit("message", {msg,type:"othermessage"})
  
       socket.emit("message",{...msg,type:"othermessage"} )
    //let reciver = msg.reciver;
    //if (clients[reciver]) clients[reciver].emit("message", msg);
    //console.log(msg);
  });
});

//server.listen(3000, "0.0.0.0", () => {
  server.listen(3000 ,() => {
      console.log("server started");});
