module.exports =
  sass:
    files:'<%= gc.cssSrc %>/*.scss'
    tasks: [
      'sass:build',
      'autoprefixer:build'
    ]

  coffeeify:
    files: '<%= gc.jsSrc %>/*.coffee'
    tasks: 'coffeeify:js'

  copy:
    files: '<%= gc.jsDest %>/animation-management.js'
    tasks: 'copy'

  uglify:
    files:'<%= gc.finalDest %>/animation-management.js'
    tasks: 'uglify:build'
