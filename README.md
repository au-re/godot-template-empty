# godot-template-empty

A starter project without any genre specific assets, but with useful addons and a solid project structure.

## Project Structure

### addons

Addons and libraries are reusable scripts that can be imported into the project. You can import an addon like so:

```
const GMoment = preload("res://addons/gmoment/gmoment.gd")
```

### assets

Images, Icons, Sounds and other binary files

### components

Reusable scenes, e.g. a player character

### environment

Godot environemnt configs

### globals

Constants, global actions, Singletons. These scripts are imported directly into godot throught AutoLoad.

### scenes

Actual scenes in the game, e.g. a waiting screen

### ui

UI components, e.g. a button
