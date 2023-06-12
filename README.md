# ARMv4 Processor

### Image Processing

To run the Python script that decodes the image's pixels into RGB values array (gray scale) and executes the histogram equalizer, run the following:

1. Create a virtual environment inside `Proyecto Final/image_processing` folder:

```
cd Proyecto\ Final/image_processing/ && python3 -m venv venv
```

2. Activate virtual environment:

```
source venv/bin/activate
```

3. Install dependencies freezed in `requirements.txt`

```
python -m pip install -r requirements.txt
```

4. Run program:

```
python equalize_img.py
```

5. When finished, deactivate virtual environment:

```
deactivate
```

### Run assembly script

To run the ARMv4 assembly script that executes the same algorithm, you'll first need to install a _Raspbian OS_ emulator.

1. Create a new directory for the system to be installed:

```
mkdir ~/qemu-vms && cd ~/qemu-vms
```

2. Download `2017-04-10-raspbian-jessie.zip` file from [Raspberry Pi Downloads](https://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/)

3. Unzip the file:

```
unzip 2017-04-10-raspbian-jessie.zip
```

4. Download OS kernel from [dhruvvyas90/qemu-rpi-kernel](https://github.com/dhruvvyas90/qemu-rpi-kernel/blob/master/kernel-qemu-4.4.34-jessie)

5. Install Raspbian OS:

```
sudo apt-get install qemu-system
```

6. Run emulator:

```
qemu-system-arm -kernel ~/qemu-vms/kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda ~/qemu-vms/2017-04-10-raspbian-jessie.img -nic user,hostfwd=tcp::5022-:22 -no-reboot
```

7. Open terminal inside emulator and enable ssh service:

```
sudo service ssh start
```

8. Open a new terminal in your local environment an connect to VM via ssh:

```
sudo ssh pi@127.0.0.1 -p 5022
```

9. Enter password: `raspberry`
10. Now your're connected to the Raspberry via SSH. Create your assembly script using the terminal.
11. Assembly script:
```
as helloworld.s -o helloworld.o
```
12. Generate executable file:
```
ld helloworld.o -o helloworld
```
13. To print bytecode:
```
objdump -d helloworld.o
```
14. To run script:
```
./helloworld
```
