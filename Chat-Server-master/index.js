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
    clients[id] = socket.id;
    console.log(clients);
    console.log(`User signed in: ${id} => ${socket.id}`);
    console.log("All connected clients:", clients); // ✅ هتطبع كل المستخدمين المتصلين
  });
  /*
  socket.on("message", (msg) => {
    console.log(msg);  
       socket.emit("message",{...msg,type:"othermessage"} )
    let reciver = msg.reciver;
   // if (clients[reciver]) clients[reciver].emit("message", {...msg,type:"othermessage"});
    console.log(reciver);
  });
});
*/
socket.on("message", (msg) => {
  console.log("Received message:", msg);

  let reciver = msg.reciver;
  let reciverSocketId = clients[reciver]; // Socket ID للطرف الآخر
  if (reciverSocketId) {
    // ✅ إرسال الرسالة فقط للطرف المستهدف
    io.to(reciverSocketId).emit("message", {
      ...msg,
      type: "othermessage",
    });
    console.log(`Message sent to: ${reciver}`);
  } else {
    console.log(`User ${reciver} is offline`);
  }
});
 
  // ✅ حذف المستخدم من القائمة عند قطع الاتصال
  socket.on("disconnect", () => {
    let userId = Object.keys(clients).find((key) => clients[key] === socket.id);
    if (userId) {
      delete clients[userId];
      console.log(`User ${userId} disconnected`);
    }
  });
});

//server.listen(3000, "0.0.0.0", () => {
  server.listen(3000 ,() => {
      console.log("server started");});
