<div align="center"><img src="https://github.com/G3bE/valacord/raw/master/resources/valacord.png" width="400px" /></div>

# valacord
The one and only Discord™-API wrapper for the Vala programming language <br>
THIS PROJECT IS DISCONTINUED. See [#1](https://github.com/G3bE/valacord/issues/1) for more info!

## Project structure
```
valacord                     | Main folder
  |                          |
  | - valacord               | Source of the lib
        |                    |
        | - valacord.vala    | Main file, includes Client class
        | - https.vala       | Handles request to the dc API
  | - tests                  | Source of the tests
        |                    |
        | test.vala          | Main source of the test
  | - README.md              | This file
  | - Makefile               | Contains all important rules for building the lib/tests
  | - COPYING                | License
  | - .gitignore             | Git file
```
## Requirements
As probably all Discord API-wrapper, valacord has some dependencies:
libsoup @v2.4
json-glib @v1.0

### Installing requirements
MacOS:
```
brew install libsoup json-glib
```

Ubuntu (not tested, the last one is guessed):
```
sudo apt-get install libsoup2.4-dev json-glib1.0-dev
```

Windows:
```
How would you use the Makefile anyways?
```
> What essentially matters when installing those packages is that pkg-config can find them. This can easily be achieved by adding the directory which contains libsoup.pc/json-glib.pc to the PKG_CONFIG_PATH environment variable. 
> To do so use 'export PKG_CONFIG_PATH="path/to/libsoup/or/json-glib/"' in the terminal you are building the lib with or copy that into your .bash_profile.
> Keep in mind this is only working on UNIX / UNIX-like systems or on Windows' WSL

## Building
There are several build rules for several objects
- libvalacord.so
  - creates the library itself
- test
  - builds the library
  - builds tests

## Usage
The lib isn't complete at the moment. Thus I have not created docs yet. However, if you still want to use it, here are some tips to get started.
### Linking
To work with the library you'll obviously need to link with it so your code can access its functions and classes. Let's say you have the following project structure:
```
MyBot
  |
  | - main.vala
  | - valacord.vapi
  | - valacord.h
  | - libvalacord.so
```
To produce a binary that can use valacord you will have to invoke the following command:
`valac --pkg=gio-2.0 --pkg json-glib-1.0 -X -I. -X -L. -X -lvalacord -o mybot main.vala valacord.vapi --basedir ./`
Let's take a look at this command.
- `--pkg=gio-2.0` enables you to create asynchronous functions that can handle events.
> As there is no gateway support atm there is no way to register event handlers.

- `--pkg json-glib-1.0` creates support for JSON objects. This is not necessarily needed but recommended.
- `lvalacord` tells the compiler to link against the valacord library
- `-o mybot` forces the compiler to name the binary mybot
- `main.vala valacord.vapi` tells the compiler our source files. `valacord.vapi` is required, so it knows we have the classes defined.
### Sample
You'll find a basic usage example in `tests/test.vala`

## Contributing
As I'm quite new to Vala, contributions in terms of, but not limited to, code style are very welcome. If you are about to create
a PR that includes such changes, please keep the following in mind:
- State what you changed exactly; I want to improve wich is easier when I know what I did wrong
- Link a style reference; knowing where to find other code style rules is very helpful

If you have 'just' added a new features, please:
- Make clear what you did; knowing wich features are already implemented helps
- If you fixed a bug; please describe why this fixes it, if it's not obvious
- Leave comments where your code is **not self-explaining**
- Create doc-strings with the following template:
```
/**
 * Do stuff
 * ========
 * 
 * This function does this stuff
 * -----------------------------
 * @arg dank: Args should be documented like this
 * @arg shit (optional): This one is optional
 * @returns: A cool object
 * @note: Keep that in mind while using
 * @TODO: couldn't implement that yet, but it's needed
 */
public cool_object do_stuff(string dank, int shit = 1337) {...}
```
Thanks for contributing btw <3
