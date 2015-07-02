module.exports = ( grunt ) ->
  pkg = grunt.file.readJSON "package.json"
  info =
    name: pkg.name.charAt(0).toUpperCase() + pkg.name.substring(1)
    version: pkg.version
  npmTasks = [
      "grunt-contrib-concat"
    ]

  grunt.initConfig
    repo: info
    pkg: pkg
    concat:
      main:
        files:
          "dest/_<%= pkg.name %>.scss": [
              # Bridge
              "build/_bridge.scss"
              # Core variables, functions
              "src/_variables.scss"
              # Mixins
              "src/mixins/_enhancement.scss"
              "src/mixins/_typography.scss"
              "src/mixins/_utilities.scss"
            ]

  grunt.loadNpmTasks task for task in npmTasks

  # Default task
  grunt.registerTask "default", [
      "concat:main"
    ]
