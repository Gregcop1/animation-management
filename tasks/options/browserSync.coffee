module.exports =
  dev:
    options:
      server: 
        baseDir: './dist/'
      watchTask: true
    bsFiles:
      src : [
        '<%= gc.cssDest %>/*.css'
        '<%= gc.jsDest %>/*.js'
      ]
