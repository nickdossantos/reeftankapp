---


---

<h1 id="reeftank-app-docs">ReefTank App Docs</h1>
<p>I am a big reefer for years now and thought it would be a great idea to graph my reef aquarium parameters. I wanted live feedback and an ability to predict issues before they happen. I am currently only running <strong>Temperature</strong>  as my live parameter(Don’t have the cash for fancy sensors). I update my temp every 5 hours. I thought that was sufficient enough. I average out the number and add it to a daily view for my line charts. You can also create your own sensors, add readings to those sensors, and create an account.</p>
<p>If you want to build something similar follow the docs.</p>
<h1 id="what-you-need">What you need</h1>
<ul>
<li>Raspberry Pi 3</li>
<li>DS18B20 Temperature Sensor (or similar)</li>
<li>Breakout Board</li>
<li>Jumper Cables</li>
<li>SD Card</li>
</ul>
<h2 id="how-to-set-up-your-pi-and-temp-sensor">How to set up your Pi and Temp Sensor</h2>
<ol>
<li>Download the latest version of <a href="https://www.raspberrypi.org/downloads/raspbian/">Raspbian</a>. After the the download is complete you need to extract the .zip file to your SD card.</li>
<li>Strip the DS18B20’s wires an connect the <strong>Black</strong> wire to the <strong>ground</strong> slot on the breakout board. Next connect the <strong>Red</strong> wire to  <strong>VCC</strong> and <strong>Yellow</strong> to the <strong>DAT</strong> slots. Once the stripped wires are connected screw them down to hold them in place.</li>
<li>Connect a Red, Yellow and Black jumper cables to the opposite ends of the breakout board for length.</li>
<li>Connect VCC wire(RED) to the 3.3V pin. Connect the ground pin to GND(BLACK). Connect DAT(YELLOW) to GPIO 4.</li>
</ol>
<p>After your OS is installed on your PI and you are successfully connected to your temperature sensor it is time to upload this script to send data to your web app. I blocked sensitive information with XXXX. I currently hard coded my script to send data to sensor 1 which I created first in my web app. I recommend doing the same quick set up.</p>
<p>*Uploading Script Soon</p>
