# net-pinger
This tool allows you to monitor the status of your devices on your network.
It might come handy to those who use IoT devices and want to see if all their devices are available.

You only need to define the IP Addresses and the names assigned to these addresses, and to adjust the frequency of the tests.
All of the available adjustments are marked with comments in the code.

- In the "pingableAddresses" array, you can define the IP addresses of the devices you wish to monitor
- In the "pingableHosts" array, you can define the name of the devices you wish to monitor.
- You can add more devices to both arrays, just follow the template, the rest of it adjusts dynamically.
- Make sure the names and the addresses are under the same index (e.g. first device name - first address, second device name - second address and so on)
- At the end of the while loop adjust how often would you like to ping the devices. By default "sleep 5" means sending a ping every 5 seconds. Feel free to move it up or down as you wish.
