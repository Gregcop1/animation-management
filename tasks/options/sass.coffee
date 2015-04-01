module.exports =
  build:
    options:
      sourcemap: true
      style: "compact"
      precision: 20
      lineNumbers: true
    files:
      '<%= gc.cssDest %>/animation-management.css': '<%= gc.cssSrc %>/animation-management.scss'
