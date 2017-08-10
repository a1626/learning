var config = [{
   name: 'helloWorld',
   entry: './helloWorld/helloWorld.jsx',

   output: {
      path:'/helloWorld/',
      filename: 'helloWorld.jsx',
   },

   devServer: {
      inline: true,
      port: 8080
   },

   module: {
      loaders: [
         {
            test: /\.jsx?$/,
            exclude: /node_modules/,
             query: {
               presets: ['es2015', 'react']
            },
            loader: 'babel-loader'
         }
      ]
   }
},


{
   name: 'functionalComp',
   entry: './functionalComp/functionalComp.jsx',

   output: {
      path:'/functionalComp/',
      filename: 'functionalComp.jsx',
   },

   devServer: {
      inline: true,
      port: 8080
   },

   module: {
      loaders: [
         {
            test: /\.jsx?$/,
            exclude: /node_modules/,
             query: {
               presets: ['es2015', 'react']
            },
            loader: 'babel-loader'
         }
      ]
   }
},


{
   name: 'clockWithState',
   entry: './clockWithState/clock.jsx',

   output: {
      path:'/clockWithState/',
      filename: 'clock.jsx',
   },

   devServer: {
      inline: true,
      port: 8080
   },

   module: {
      loaders: [
         {
            test: /\.jsx?$/,
            exclude: /node_modules/,
             query: {
               presets: ['es2015', 'react']
            },
            loader: 'babel-loader'
         }
      ]
   }
}]

module.exports = config;
