module.exports =
  dev:
    options:
      server: 
        baseDir: './dist/'
      watchTask: true
    bsFiles:
      src : [
        '<%= in8.cssDest %>/*.css'
        '<%= in8.jsDest %>/*.js'
      ]
