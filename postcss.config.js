module.exports = {
  plugins: [
    require('postcss-smart-import')(),
    require('postcss-simple-vars')(),
    require('postcss-compact-mq')(),
    require('postcss-cssnext')(),
    require('lost')(),
    require('css-mqpacker')(),
    require('postcss-reporter')()
  ]
}
