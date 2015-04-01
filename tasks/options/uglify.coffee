module.exports =
  options:
    banner: '/*! uglified <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
    sourceMap: true,
  build:
    files: 
      '<%= gc.finalDest %>/animation-management.min.js' : '<%= gc.finalDest %>/animation-management.js'
