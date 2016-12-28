const {resolve, join} = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin');
const merge = require('webpack-merge');

const appEntry = './static/index.js';
const devServerPath = [ 'webpack-dev-server/client?http://localhost:8080' ]

const config = (env = {}) => {

  const common = {
    context: resolve('src'),

    devtool: env.prod
      ? 'source-map'
      : 'eval',

    output: {
      filename: env.prod
        ? '[name].[chunkhash].js'
        : '[name].js',
      path: resolve('dist'),
      pathinfo: !env.prod
    },

    resolve: {
      extensions: ['.js', '.elm'],
    },

    performance: {
      hints: false
    },

    devServer: {
      historyApiFallback: true,
      quiet: true
    },

    plugins: [

      new ExtractTextPlugin(env.prod
        ? '[name].[chunkhash].css'
        : '[name].css'),

      new HtmlWebpackPlugin({template: 'static/index.html', inject: 'body', filename: 'index.html'}),

    ]
  };

  const devConfig = {
    entry: {
      app: devServerPath.concat(appEntry)
    },

    module: {
      loaders: [
        {
          test: /\.elm$/,
          exclude: [
            /elm-stuff/, /node_modules/
          ],
          loaders: [
            {
              loader: 'elm-hot-loader'
            },
            {
              loader: 'elm-webpack-loader',
              query: {
                verbose: true,
                warn: true,
                debug: true
              }
            }
          ]
        }, {
          test: /\.css$/,
          loader: 'style-loader!css-loader!postcss-loader',
        }
      ]
    }
  };

  const prodConfig = {
    entry: {
      app: appEntry
    },

    module: {
      loaders: [
        {
          test: /\.elm$/,
          exclude: [
            /elm-stuff/, /node_modules/
          ],
          loaders: [
            {
              loader: 'elm-webpack-loader',
              query: {
                verbose: false,
                warn: false,
                debug: false
              }
            }
          ]
        }, {
          test: /\.css$/,
          loader: ExtractTextPlugin.extract({
            loader: [
              {
                loader: 'css-loader'
              }, {
                loader: 'postcss-loader',
              }
            ]
          })
        }
      ]
    }
  };

  return env.prod
    ? merge(common, prodConfig)
    : merge(common, devConfig);
}

module.exports = (env) => config(env);
