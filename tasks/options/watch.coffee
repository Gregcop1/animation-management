module.exports =
  sass:
    files:'<%= in8.cssSrc %>/*.scss'
    tasks: [
      'sass:build',
      'autoprefixer:build'
    ]

  coffeeify:
    files:'<%= in8.js %>/*.coffee'
    tasks: 'coffeeify:js'

  uglify:
    files:'<%= in8.jsDest %>/animation-management.js'
    tasks: 'uglify:build'
