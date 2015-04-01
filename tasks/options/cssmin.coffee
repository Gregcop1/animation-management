module.exports =
  minify:
    options:
      banner: '/*! minified <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
    expand: true
    cwd: '<%= gc.cssDest %>/'
    src: '*.css'
    dest: '<%= gc.cssDest %>/'