module.exports =
  build:
    options:
      sourcemap: true
      style: "compact"
      precision: 20
      lineNumbers: true
    files:
      '<%= in8.cssDest %>/animation-management.css': '<%= in8.cssSrc %>/animation-management.scss'
