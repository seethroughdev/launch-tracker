# Elm Boilerplate

This my current boilerplate for building Elm apps.  It makes use of:

- Elm 0.18
- Webpack 2
- PostCSS
- Routing
- Hot Module Reloading / Dev Server

With what I feel are some sensible defaults.

Its heavily inspired by: [elm-webpack-starter][1].  I started to use it, but wanted to make so many customizations that i felt it would be better to make a new one.

### Install

```
git clone https://github.com/seethroughtrees/elm-boilerplate.git && cd elm-boilerplate
rm -rf .git
npm run setup
```

### Usage

```
npm start
```

Visit http://localhost:8080/ and start editing.

For compiled production build:

```
npm run build
```

### Features

#### It retains the following features from [elm-webpack-starter][1]:

- Dev server, live reloading, HMR!
- Simple dev and production builds


#### Here's the main differences:

- Added multi-file structure
- Removed Bootstrap
- Removed jQuery
- Removed Sass
- Replace Sass with PostCSS - [config](https://github.com/seethroughtrees/elm-boilerplate/blob/master/postcss.config.js)
- Added Yarn
- Added CSS normalizr
- Added complete gitignore
- Upgraded and rebuilt for Webpack 2
- Used Html.program instead of beginnerProgram, as I prefer to have Cmd.
- Isolated app code in Main.elm

--------------

### Contributing

This can easily be configured further, and in some ways it is opinionated.  If you have suggestions for ways to make it better, please open an issue and discuss!

Thanks again to Moarwick, and the [elm-webpack-starter][1].  And of course all the hard working OSS devs that made all this a possibility.

[1]: https://github.com/moarwick/elm-webpack-starter
