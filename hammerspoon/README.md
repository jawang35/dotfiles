# Hammerspoon

Lua scripts for [Hammerspoon](http://www.hammerspoon.org/) configuration. `init.lua` is the entrypoint that loads all the other modules.

## Usage

```
ln -s /path/to/dotfiles/hammerspoon ~/.hammerspoon
```

## Hyper Key

`HYPER` key is bound to `CTRL+OPTION+CMD`. Optionally, disable `CAPSLOCK` and map it to `CTRL+OPTION+CMD` to create a pseudo `HYPER` key.

## Applications

`HYPER+A` opens the application modal. `ESCAPE` closes the application modal. With the application modal open, the following keys launch or switch to the corresponding applications and close the application modal:

| Key       | Application       |
|:---------:| ----------------- |
| `HYPER+A` | Atom              |
| `HYPER+C` | Google Chrome     |
| `HYPER+M` | Messages          |
| `HYPER+O` | Microsoft Outlook |
| `HYPER+P` | 1Password 6       |
| `HYPER+S` | Slack             |
| `HYPER+T` | Terminal          |

## Reload Config

`HYPER+R` reloads the Hammerspoon config.

## Windows

The following keys act on the active window:

| Key             | Action       |
|:---------------:| ------------ |
| `HYPER+F`       | Full Screen  |
| `HYPER+C`       | Center       |
| `HYPER+H`       | Left Half    |
| `HYPER+J`       | Bottom Half  |
| `HYPER+K`       | Top Half     |
| `HYPER+L`       | Right Half   |
| `HYPER+SHIFT+H` | Left Screen  |
| `HYPER+SHIFT+J` | Lower Screen |
| `HYPER+SHIFT+K` | Upper Screen |
| `HYPER+SHIFT+L` | Right Screen |
