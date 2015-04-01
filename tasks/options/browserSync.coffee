module.exports =
  dev:
    options:
      watchTask: true
    bsFiles:
      src : [
        '<%= in8.cssDest %>/*.css'
        '<%= in8.jsDest %>/*.js'
      ]
