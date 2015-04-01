module.exports = (grunt)->
  grunt.registerTask 'default', [
    'concurrent:builds'
    'browserSync'
    'watch'
  ]
