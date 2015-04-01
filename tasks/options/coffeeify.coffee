module.exports =
  js:
    options: {}
    files: [
      src:  ['<%= gc.jsSrc %>/animation-management.coffee']
      dest: '<%= gc.jsDest %>/animation-management.js'
    ]
