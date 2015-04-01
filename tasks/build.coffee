module.exports = (grunt)->
  grunt.registerTask 'build', [
    'concurrent:builds'
    'autoprefixer:build'
    'cssmin:minify'
    'copy:final'
    'uglify:build'
  ]
