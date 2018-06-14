const path = require('path')
const webpack = require('webpack')
const CleanWebpackPlugin = require('clean-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')

module.exports = {
  entry: [ path.join(__dirname, 'src/index.js')],
  output: {
    path: path.join(__dirname, '../priv/static'),
    filename: 'js/app.js'
  },
  resolve: {
    extensions: [ '.js', '.jsx', '.json'],
    modules: [ path.join(__dirname), 'node_modules' ]
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel-loader',
        options: { presets: ['react', 'env'] }
      },
      {
        test: /\.css$/,
        use: [ 'style-loader', 'css-loader' ]
      }
    ]
  },
  plugins: [
    new CleanWebpackPlugin(['priv/static'], { root: path.join(__dirname, '..') }),
    new CopyWebpackPlugin([{ from: path.join(__dirname, 'static') }])
  ]
};