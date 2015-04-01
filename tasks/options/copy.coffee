module.exports = 
  final:
    files: [{
      expand: true
      flatten: true
      cwd: '<%= gc.jsDest %>/'
      src: 'animation-management.js'
      dest: '<%= gc.finalDest %>'
    }]