const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

let items = [
    {name:"Walking mountain",image:"assets/images/travel-1.jpg",rate:"5.0",location:"Thailand"},
    {name:"Forest jump",image:"assets/images/travel-2.jpg",rate:"4.9",location:"Singapore"},
    {name:"PM 2.5",image:"assets/images/travel-3.jpg",rate:"4.7",location:"France"},
    {name:"Forest have witch",image:"assets/images/travel-4.jpg",rate:"5.0",location:"Germany"},
    {name:"Boat into the mountain",image:"assets/images/travel-5.jpg",rate:"4.5",location:"United States"},
    {name:"Lake with mountain",image:"assets/images/travel-6.jpg",rate:"4.6",location:"Australia"},
    {name:"Lake with forest",image:"assets/images/travel-7.jpg",rate:"4.8",location:"Phuket, Thailand"},
    {name:"Lake with people in the boat",image:"assets/images/travel-8.jpg",rate:"4.4",location:"Canada"},
    {name:"lake with monster",image:"assets/images/travel-9.jpg",rate:"4.9",location:"Switzerland"},
    {name:"Beautiful lake",image:"assets/images/travel-10.jpg",rate:"4.7",location:"Denmark"},
    {name:"beach in thai!",image:"assets/images/travel-11.jpg",rate:"4.3",location:"Pattaya, Thailand"},
    {name:"Sand mountain",image:"assets/images/travel-12.jpg",rate:"4.1",location:"Saudi Arabia"}
];


//Routing
//http://localhost:3000/items
app.get('/items',(req,res) => {
    res.json(items);
});

app.get('/items/:name',(req,res) => {
    const item = items.find(i => i.name == req.params.name);
    res.json(item);
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});