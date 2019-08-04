# Stratis GUI written in Flutter

To start the app with root privileges (required to perform actual actions, even if on the simulator), run the app using `sudo`. To do that, you have to run it on X.Org. Wayland will be supported once the app will use Polkit to get the root privileges when it needs them.

At the moment it prints the result to the command line, the GUI is there just as a trigger, at the moment it's more of a way to test whether the plugin actually works with an app.