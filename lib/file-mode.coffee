# FileModeView = require './file-mode-view'

console.log ( "loaded file-mode")

module.exports =

  activate: ->
    console.log("activate file-mode")
    atom.workspace.onDidOpen => @load()
    atom.workspace.onDidAddTextEditor => @load()
    atom.commands.add 'atom-workspace', "file-mode:load", => @load(event)

  opened: ( event ) ->
    console.log ( event )

  load: ->
    console.log("setting file-mode")
    m = /-\*-\s?mode:\s?([A-Za-z0-9_\- ]+)-\*-/.exec ( atom.workspace.getActivePaneItem().getText() )
    if ( m )
      mode = m[1].replace /^\s+|\s+$/g, ""
      for grammar in atom.grammars.grammars
        console.log ( "Looking at " + grammar.name )
        if ( grammar.name.toUpperCase() == mode.toUpperCase() )
          console.log ( "setting mode to " + mode )
          atom.workspace.getActivePaneItem().setGrammar(grammar)
          break
    else
      console.log  ( "Didn't find a syntax " )
    console.log ( m )

module.exports.activate()
# -*- mode: CoffeeScript -*-
