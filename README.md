# chaotic-AUR-installer
A simple script to install [chaotic AUR](https://aur.chaotic.cx/) third party repo in arch linux or arch based distros!


## What is AUR?

AUR stands for Arch User repository. It's maintained by a third party but pkgbuilds are available to everyone. It actually doesn't store any package files or any binary. Instead it tells the system where to look for the binary and how to build it from source into a binary package for installation. AUR can be maintained by almost anyone with proper knowledge and of course, due to the absence of a maintainer, anyone else can take over. And thus AUR is growing constantly over time. AUR has so many packages that it really gives the chill! And another kool thing is that whenever an update is available you can just simply use an AUR helper! It'll take the rest of the steps from you to update your AUR packages! No need to go to each upstream and check versions manually. A lot of people are interested in arch linux just for this AUR!


## What is Chaotic-AUR?

Automated building repo for AUR packages. Check their [Github repo](https://github.com/chaotic-aur).

As I said earlier,
"It (AUR) actually doesn't store any package files or any binary. Instead it tells the system where to look for the binary and how to build it from source into a binary package for installation."
Suppose you are trying to install a web browser through AUR. So for building it from source, you need other packages like compilers. It may take extra data and effort. And let's not forget the chance of failure during the building process and high CPU usage. It can even freeze your PC. You can uninstall those dependency packages (other packages like compilers) but while updating that application, you'll need those dependencies to build it again from source. And the whole process may take even several hours (worst case scenario).
So, here comes chaotic AUR. It actually builds those packages constantly using bots and prepares the binary/ compiled package for your ease of access. So that you don't have to waste time building those packages!

## How to use it?

Just run the following one line command in your terminal to run this script, simple!

```wget -q -O chaotic-AUR-installer.bash https://raw.githubusercontent.com/SharafatKarim/chaotic-AUR-installer/main/install.bash && sudo bash chaotic-AUR-installer.bash && rm chaotic-AUR-installer.bash```

As an alternative, you can git clone this repository and run the script as root (`install.bash`) manually.

## Why is this script so large?

Besides installation, this script will also check whether it's previously installed and this script can also take actions such as uncommenting lines from pacman's config file or downloading and moving mirrorlist. So read the script before running! It's easy to understand. If you have any suggestions feel free to tell [me](t.me/SharafatKarim).

## FAQ

Nothing asked yet!

