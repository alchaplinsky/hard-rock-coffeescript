module.exports = (grunt) =>
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    gitbook:
      development:
        input: "./"
        github: "alchapone/hard-rock-coffeescript"
    "gh-pages":
      options:
        base: '_book'
      src: ['**']
    clean:
      files: '.grunt'
    watch:
      pages:
        files: ["**/*.md"]
        tasks: ['gitbook']

  grunt.registerTask 'publish', ['gitbook', 'gh-pages','clean']
