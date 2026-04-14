const http = require('http'); 
const req = http.request({
  hostname: 'localhost', 
  port: 3000, 
  path: '/api/download', 
  method: 'POST', 
  headers: {'Content-Type': 'application/json'}
}, res => { 
  res.on('data', d => console.log(d.toString())); 
}); 
req.write(JSON.stringify({url: 'https://www.tiktok.com/@karine.lemarchand/video/7311142502672010529', format: 'mp4', quality: '1080'})); 
req.end();
