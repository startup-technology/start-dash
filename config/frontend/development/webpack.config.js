module.exports = {
  devtool: 'inline-source-map',
  entry: {
    application: './frontend/assets/javascripts/application.js'
  },
  output: {
    path: './app/assets/javascripts',
    filename: '[name].bundle.js'
  },
  module: {
    loaders: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loader: 'babel?presets[]=react,presets[]=es2015,presets[]=stage-2'
      }
    ]
  }
}
