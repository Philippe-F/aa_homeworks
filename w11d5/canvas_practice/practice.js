document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas'); 
  const ctx = canvas.getContext('2d'); 

  ctx.beginPath();
  ctx.fillStyle = 'red';
  ctx.fillRect(20, 10, 150, 100);

  ctx.beginPath();
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 10;
  ctx.stroke();
});
