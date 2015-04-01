module.exports =
  options:
    banner: '/*! uglified <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
    sourceMap: true,
  build:
    files: [{
      expand: true,
      src: '<%= in8.jsDest %>/animation-management.js',
      dest: '<%= in8.jsDest %>/animation-management.min.js'
    }]
